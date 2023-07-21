import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/variables.dart';
import 'widgetsble.dart';
import 'package:kabanta_app1/Providers/device_provider.dart';
import 'package:provider/provider.dart';
import 'package:kabanta_app1/main.dart';

class FindDevicesScreen extends StatefulWidget {
  const FindDevicesScreen({Key? key}) : super(key: key);

  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState();
}

class _FindDevicesScreenState extends State<FindDevicesScreen> {
  bool isLoading = false;
  BluetoothDevice? selectedDevice;
  bool isConnected = false;
  @override
  //Este initstate permite la busqueda de dispositivos Bluetooth una vez construido el widget
  void initState() {
    super.initState();
    startScan();
  }

  //actualiza cada 4 s la busqueda
  Future<void> startScan() async {
    await FlutterBluePlus.instance
        .startScan(timeout: const Duration(seconds: 20));
  }

  void connectToDevice(ScanResult result) {
    final device = result.device;

    // Con¡§?ctate solo si el nombre del dispositivo coincide con el texto del QR
    setState(() {
      isLoading = true;
    });
    device.connect().then((_) {
      setState(() {
        isLoading = false;
        selectedDevice = device;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DataPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<List<ScanResult>>(
            stream: FlutterBluePlus.instance.scanResults,
            initialData: const [],
            builder: (c, snapshot) => Column(
              children: <Widget>[
                ...snapshot.data!.map(
                  (r) => ScanResultTile(
                    result: r,
                  ),
                ),
              ],
            ),
          ),
          
        ],
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
              child: Text(
                widget.device.name,
                style: signaLabel,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<BluetoothDeviceState>(
              stream: widget.device
                  .state, //recibe el estado state del dispositovo Bluetooth
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
                );
              },
            ),
            StreamBuilder<List<BluetoothService>>(
              //recibe la lista de servicios (services) del dispositivo
              stream: widget.device.services,
              initialData: const [],
              builder: (c, snapshot) {
                return Column(
                  children: _buildServiceTiles(snapshot
                      .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                );
              },
              //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
            ),
          ],
        ),
      ),
    );
  }
}
