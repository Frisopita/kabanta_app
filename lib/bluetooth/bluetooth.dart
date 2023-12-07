import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:collection/collection.dart';
import 'package:kabanta_app1/bluetooth/widgetsble.dart';
import 'package:kabanta_app1/providers/clock_provider.dart';
import 'package:kabanta_app1/providers/device_provider.dart';
import 'package:kabanta_app1/bluetooth/qrble.dart';
import 'package:kabanta_app1/main.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:provider/provider.dart';

enum _ErrorType { connection, notFound }

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
                    'Bluetooth is off,',
                    style: blueText,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'to use the app, it is necessary to turn',
                    style: blueText,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorbackbutt1,
                    foregroundColor: colorforebutt1,
                  ),
                  child: const Text('Turn on Bluetooth'),
                  onPressed: () {
                    FlutterBluePlus.turnOn();
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
  State<FindDevicesScreen> createState() => _FindDevicesScreenState();
}

class _FindDevicesScreenState extends State<FindDevicesScreen> {
  late final StreamSubscription<BluetoothDevice?> stream;
  BluetoothDevice? lastScan;
  bool isLoading = false;
  _ErrorType? errorType;

  @override
  //Este initstate permite la busqueda de dispositivos Bluetooth una vez construido el widget
  void initState() {
    super.initState();
    stream = FlutterBluePlus.scanResults
        .map(
          (event) => widget.qrText.isEmpty
              ? null
              : event
                  .firstWhereOrNull(
                      (scan) => scan.device.localName == widget.qrText)
                  ?.device,
        )
        .distinct((prev, curr) => prev?.localName == curr?.localName)
        .listen((device) {
      lastScan = device;
      if (device != null) {
        _connectToDevice(device).catchError((_) => _showErrorIfAny());
      } else {
        _clear();
      }
    });
    Future.microtask(startScan);
  }

  void _showErrorIfAny() {
    setState(() {
      isLoading = false;
      errorType = lastScan != null ? _ErrorType.connection : null;
    });
  }

  void _clear() {
    setState(() {
      isLoading = false;
      if (errorType != _ErrorType.notFound) {
        errorType = null;
      }
    });
  }

  //actualiza cada 10s la busqueda
  Future<void> startScan() async {
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
    if (mounted && !isLoading && errorType == null) {
      setState(() => errorType = _ErrorType.notFound);
    }
  }

  void _retry() {
    final device = lastScan;
    if (device != null) {
      _connectToDevice(device).catchError((_) => _showErrorIfAny());
    } else if (errorType == _ErrorType.notFound) {
      _showErrorIfAny();
      startScan().ignore();
    } else {
      _clear();
    }
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    if (isLoading || errorType != null) return;
    isLoading = true;
    await device.connect();
    final list = await device.discoverServices();

    if (!mounted) return;
    context.read<DeviceProvider>().setDevice(device, list);
    context.read<DeviceProvider>().setService(list);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DataPage(),
      ),
    );
  }
  
  @override
  void dispose() {
    FlutterBluePlus.stopScan().ignore();
    stream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget body;
    if (errorType != null) {
      switch (errorType) {
        case _ErrorType.notFound:
          body = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: _retry,
                icon: Icon(
                  Icons.refresh_rounded,
                  color: colorbackbutt1,
                ),
                label: Text(
                  'Reintentar conectarse',
                  style: TextStyle(color: colorbackbutt1),
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorbackbutt1,
                  foregroundColor: colorforebutt1,
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrboardPage(),
                  ),
                ),
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('Cambiar ID'),
              ),
            ],
          );
          break;
        default:
          body = ElevatedButton.icon(
            onPressed: _retry,
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.indigo,
            ),
            label: const Text(
              'Reintentar conectarse',
              style: TextStyle(color: Colors.indigo),
            ),
          );
          break;
      }
    } else {
      body = Column(
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
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Conectando a ${widget.qrText}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
        ],
      );
    }
    return Scaffold(body: Center(child: body));
  }
}
