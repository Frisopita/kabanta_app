import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:kabanta_app1/main.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:kabanta_app1/Providers/device_provider.dart';
import 'package:provider/provider.dart';
import 'widgetsble.dart';

bool isLoading = false;
BluetoothDevice? selectedDevice;
bool isConnected = false;

class QrBoardScreen extends StatefulWidget {
  const QrBoardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrBoardScreenState();
}

class _QrBoardScreenState extends State<QrBoardScreen> {
  Barcode? qrResult;
  QRViewController? qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Container(
      width: 310,
      height: 310,
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea,
        ),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      qrController = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrResult = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No permission')),
      );
    }
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

  @override
  Widget build(BuildContext context) {
    var device = Provider.of<DeviceProvider>(context).device; 
    String deviceName = device != null ? device.name : '';
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
    deviceName,
    style: signaLabel,
  ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Scan QR Code',
                textAlign: TextAlign.center,
                style: titleLabel,
              ),
            ),
            SizedBox(
              child: _buildQrView(context),
            ), // QR view gets more space
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'or Enter Id number',
                textAlign: TextAlign.center,
                style: titleLabel,
              ),
            ),
            Padding(
              // Add some padding to bound the TextField
              padding: const EdgeInsets.all(10),
              child: qrResult != null
                  ? TextField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${qrResult!.code}'),
                    )
                  : const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Enter id'),
                    ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: colorbackbutt1,
                  foregroundColor: colorforebutt1),
              onPressed: () {
                if (qrResult != null) {
                  // Connect to the device with the QR code data (if any)
                  // Assuming the QR code data represents the device's ID or something similar
                  final String deviceId = qrResult!.code ?? '';
                  connectToDevice(deviceId);
                } else {
                  // No QR code data, show a message or take some action
                }
              },
              child: const Text("Connect"),
            ),
            StreamBuilder<List<BluetoothDevice>>(
              stream: Stream.periodic(const Duration(seconds: 2))
                  .asyncMap((_) => FlutterBluePlus.instance.connectedDevices),
              initialData: const [],
              builder: (c, snapshot) => Column(
                children: snapshot.data!
                    .map(
                      (d) => ListTile(
                        title: Text(d.name),
                        trailing: StreamBuilder<BluetoothDeviceState>(
                          stream: d.state,
                          initialData: BluetoothDeviceState.disconnected,
                          builder: (c, snapshot) {
                            if (snapshot.data == BluetoothDeviceState.connected) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorbackbutt1,
                                  foregroundColor: colorforebutt1),
                                child: const Text('OPEN'),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DeviceScreen(device: d),
                                    ),
                                  );
                                },
                              );
                            }
                            return Text(snapshot.data.toString());
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
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