import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:kabanta_app1/main.dart';
import 'package:kabanta_app1/variables.dart';

class QrboardPage extends StatefulWidget {
  const QrboardPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrboardPageState();
}

class _QrboardPageState extends State<QrboardPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/original.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: const <Widget>[
          /*
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
            child: Center(
              child: Text(
                widget.device.name,
                style: signaLabel,
              ),
            ),
          ),*/
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
              child: result != null
                  ? TextField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${result!.code}'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DataPage()),
                );
              },
              child: const Text("Connect"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Container(
      width: 310, // Establece el ancho deseado
      height: 310, // Establece la altura deseada
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}