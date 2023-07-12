import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart'; // Quitar
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/Pages/ecg.dart';
import 'package:kabanta_app1/variables.dart';
import 'widgets.dart';

class FindDevicesScreen extends StatefulWidget {
  const FindDevicesScreen({Key? key}) : super(key: key);

  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState();
}

class _FindDevicesScreenState extends State<FindDevicesScreen> {
  @override
  //Este initstate permite la busqueda de dispositivos Bluetooth una vez construido el widget
  void initState() {
    super.initState();
    startScan();
  }

  //actualiza cada 4 s la busqueda
  Future<void> startScan() async {
    await FlutterBluePlus.instance
        .startScan(timeout: const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/original.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () => FlutterBluePlus.instance
            .startScan(timeout: const Duration(seconds: 3)),
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: <Widget>[
                StreamBuilder<List<BluetoothDevice>>(
                  stream: Stream.periodic(const Duration(seconds: 2))
                      .asyncMap((_) => FlutterBluePlus.instance.connectedDevices),
                  initialData: const [],
                  builder: (c, snapshot) => Column(
                    children: snapshot.data!
                        .map((d) => ListTile(
                              title: Text(d.name),
                              trailing: StreamBuilder<BluetoothDeviceState>(
                                stream: d.state,
                                initialData: BluetoothDeviceState.disconnected,
                                builder: (c, snapshot) {
                                  if (snapshot.data ==
                                      BluetoothDeviceState.connected) {
                                    return ElevatedButton(
                                      child: const Text('OPEN'),
                                      onPressed: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DeviceScreen(device: d))),
                                    );
                                  }
                                  return Text(snapshot.data.toString());
                                },
                              ),
                            ))
                        .toList(),
                  ),
                ),
                StreamBuilder<List<ScanResult>>(
                  stream: FlutterBluePlus.instance.scanResults,
                  initialData: const [],
                  builder: (c, snapshot) => Column(
                    children: snapshot.data!
                        .map(
                          (r) => ScanResultTile(
                            result: r,
                            onTap: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              r.device.connect();
                              return DeviceScreen(device: r.device);
                            })),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  List<Widget> _buildServiceTiles(List<BluetoothService> services) {
    return services
        .map(
          (s) => ServiceTile(
            service: s,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Image.asset('Images/original.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
            child: Center(
              child: Text(widget.device.name, style: signaLabel,),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          StreamBuilder<BluetoothDeviceState>(
            stream: widget.device.state, //recibe el estado state del dispositovo Bluetooth
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) {
              if (snapshot.data == BluetoothDeviceState.connected) {
                widget.device.discoverServices();
              }
              return ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      snapshot.data == BluetoothDeviceState.connected
                          ? const Icon(Icons.bluetooth_connected)
                          : const Icon(Icons.bluetooth_disabled),
                    ],
                  ),
                  title: Text(
                      'Device is ${snapshot.data.toString().split('.')[1]}.'),
                  trailing: SizedBox(
                    width: 30,
                    child: StreamBuilder<bool>(
                      stream: widget.device.isDiscoveringServices,
                      initialData: false,
                      builder: (c, snapshot) => IndexedStack(
                        index: snapshot.data! ? 1 : 0,
                      ),
                    ),
                  ));
            },
          ),
          StreamBuilder<List<BluetoothService>>(
            //recibe la lista de servicios (services) del dispositivo
            stream: widget.device.services,
            initialData: const [],
            builder: (c, snapshot) {
              return Column(
                children: _buildServiceTiles(snapshot.data!), //muestra los ServiceTile generados por el m��todo _buildServiceTiles.
              );
            },
            //Los ServiceTile y CharacteristicTile se generan din��micamente en funci��n de los datos recibidos.
          ),
        ],
      ),
      ),
    );
  }
}
