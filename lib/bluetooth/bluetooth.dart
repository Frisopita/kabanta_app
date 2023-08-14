import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import '../Providers/device_provider.dart';
import 'package:kabanta_app1/main.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:collection/collection.dart';

class BluetoothScreenOffOn extends StatelessWidget {
  const BluetoothScreenOffOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.bluetooth_disabled,
                    size: 150.0,
                    color: Colors.indigo.shade700,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Bluetooth apagado,',
                    style: blueText,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'es necesario prenderlo',
                    style: blueText,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorbackbutt1,
                    foregroundColor: colorforebutt1,
                  ),
                  child: const Text('Activar Bluetooth'),
                  onPressed: () {
                    FlutterBluePlus.instance.turnOn();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FindDevicesScreen extends StatefulWidget {
  const FindDevicesScreen({Key? key, required this.qrText}) : super(key: key);

  final String qrText;

  @override
  State<FindDevicesScreen> createState() =>
      _FindDevicesScreenState(qrText: qrText);
}

class _FindDevicesScreenState extends State<FindDevicesScreen> {
  String qrText;

  _FindDevicesScreenState({required this.qrText});
  late StreamSubscription<List<ScanResult>> subscription;
  bool isLoading = false;
  @override
  //Este initstate permite la busqueda de dispositivos Bluetooth una vez construido el widget
  void initState() {
    super.initState();
    startScan();
  }

  //actualiza cada 4 s la busqueda
  Future<void> startScan() async {
    subscription =
        FlutterBluePlus.instance.scanResults.listen(_connectToDevice);
    await FlutterBluePlus.instance
        .startScan(timeout: const Duration(seconds: 20));
  }

  Future<void> _connectToDevice(List<ScanResult> resultslist) async {
    final scanresult = resultslist
        .firstWhereOrNull((element) => element.device.name == qrText);
    if (scanresult != null && !isLoading) {
      final deviceprovider =
          Provider.of<DeviceProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      await scanresult.device.connect();
      isLoading = true;
      List<BluetoothService> services =
          await scanresult.device.discoverServices();
      deviceprovider.setDevice(scanresult.device);
      navigator.pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const DataPage()),
          (Route route) => false);
    }
  }

  @override
  void dispose() {
    FlutterBluePlus.instance.stopScan();
    subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blueGrey.shade100,
                  strokeWidth: 7,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.indigo),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Conectando a ${qrText}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
