import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'widgetsble.dart';
import 'package:kabanta_app1/main.dart';

class FindDevicesScreen extends StatefulWidget {
  const FindDevicesScreen({Key? key, required this.qrText}) : super(key: key);

  final String qrText;

  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState(qrText: qrText);
}


class _FindDevicesScreenState extends State<FindDevicesScreen> {
  String qrText;

  _FindDevicesScreenState({required this.qrText});

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
