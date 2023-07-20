import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/variables.dart';
import 'widgetsble.dart';
import 'package:kabanta_app1/Providers/device_provider.dart';
import 'package:provider/provider.dart';
import 'package:kabanta_app1/main.dart';

bool isLoading = false;
BluetoothDevice? selectedDevice;
bool isConnected = false;

class FindDevicesScreen extends StatefulWidget {
  const FindDevicesScreen({Key? key, required this.qrText}) : super(key: key);

  final String qrText;

  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState(qrText: qrText);
}


class _FindDevicesScreenState extends State<FindDevicesScreen> {
  String qrText;
  _FindDevicesScreenState({required this.qrText});
  
  @override
  //Este initstate permite la busqueda de dispositivos Bluetooth una vez construido el widget
  void initState() {
    super.initState();
    startScan();
  }

  //actualiza cada 4 s la busqueda
  Future<void> startScan() async {
    await FlutterBluePlus.instance.startScan();
  }

  void connectToDevice(ScanResult result) {
    final device = result.device;
    if (device.name == qrText) {
      // Con¨¦ctate solo si el nombre del dispositivo coincide con el texto del QR
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
  }

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
      body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: <Widget>[
                StreamBuilder<List<ScanResult>>(
                  stream: FlutterBluePlus.instance.scanResults,
                  initialData: const [],
                  builder: (c, snapshot) => Column(
                    children: <Widget>[
                      if (isLoading) const CircularProgressIndicator(),
                      ...snapshot.data!.map(
                        (r) => ScanResultTile(
                          result: r,
                          onTap: () {
                            Provider.of<DeviceProvider>(context, listen: false)
                                .setDevice(r.device);
                            connectToDevice(r);
                          },
                        ),
                      ),
                      if (isConnected && selectedDevice != null)
                        StreamBuilder<List<BluetoothService>>(
                          stream: selectedDevice?.services ?? const Stream<List<BluetoothService>>.empty(),
                          initialData: const [],
                          builder: (context, snapshot) {
                            return Column(
                              children: _buildServiceTiles(snapshot.data!),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}