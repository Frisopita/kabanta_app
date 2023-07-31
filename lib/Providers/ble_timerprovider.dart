import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:async/async.dart';

class BLEWriteTimer {
  final String id;
  final String data;

  const BLEWriteTimer(this.id, this.data);
}

class BleWriteTimerProvider extends ChangeNotifier {
  BluetoothService? _service;

  Stream<List<BLEWriteTimer>> _stream = const Stream.empty();

  Stream<List<BLEWriteTimer>> get stream => _stream;

  late double currentTimerValue1;


  BleWriteTimerProvider();

  void updateTimerValue1(double newValue) {
    currentTimerValue1 = newValue;
    notifyListeners();
  }



  /// Internal Services UUID allowed (whitelist)

  static const Map<String, String> _allowedUUIDs = {
    'aea7aac8-5a97-488e-bd01-4166d22ec81e': 'Timer'
  };

  /// No importan, pero da error en el widget que dejamos de usar y no lo borre
  set id(String id) {}
  void setValue(Uint8List readValues) {}

  Future<void> initService(BluetoothService service) async {

    _service = service;
    List<BluetoothCharacteristic> listBle = service.characteristics
        .where((c) => _allowedUUIDs.containsKey(c.uuid.toString()))
        .toList();

    await Future.forEach(listBle, (element) => element.setNotifyValue(true));

    Future<void> writeCharacteristic() async {
      await service.characteristics[0].write([currentTimerValue1.toInt()], withoutResponse: true);
    }
    writeCharacteristic();

    Iterable<Stream<BLEWriteTimer>> streams = listBle
        .map(
          (c) => c.value.map((event) {
            String value = String.fromCharCodes(event);
            String uuid = c.uuid.toString();
            return BLEWriteTimer(_allowedUUIDs[uuid]!, value);
          }),
        );
    _stream = StreamZip(streams);


    notifyListeners();
  }

  String get debug {
    return '''

    ''';
  }
}