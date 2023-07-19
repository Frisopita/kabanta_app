import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:async/async.dart';

class BLEWrite {
  final String id;
  final String data;

  const BLEWrite(this.id, this.data);
}

class BleWriteSliderProvider extends ChangeNotifier {
  BluetoothService? _service;

  Stream<List<BLEWrite>> _stream = const Stream.empty();

  Stream<List<BLEWrite>> get stream => _stream;

  late double currentSliderValue1;
  late double currentSliderValue2;
  late double currentSliderValue3;
  late double currentSliderValue4;
  late double currentSliderValue5;
  late double currentSliderValue6;
  late double currentSliderValue7;

  BleWriteSliderProvider(
    this.currentSliderValue1,
    this.currentSliderValue2,
    this.currentSliderValue3,
    this.currentSliderValue4,
    this.currentSliderValue5,
    this.currentSliderValue6,
    this.currentSliderValue7,
    );

  void updateSliderValue1(double newValue) {
    currentSliderValue1 = newValue;
    notifyListeners();
  }

  void updateSliderValue2(double newValue) {
    currentSliderValue2 = newValue;
    notifyListeners();
  }

  void updateSliderValue3(double newValue) {
    currentSliderValue3 = newValue;
    notifyListeners();
  }

  void updateSliderValue4(double newValue) {
    currentSliderValue4 = newValue;
    notifyListeners();
  }

  void updateSliderValue5(double newValue) {
    currentSliderValue5 = newValue;
    notifyListeners();
  }

  void updateSliderValue6(double newValue) {
    currentSliderValue6 = newValue;
    notifyListeners();
  }

  void updateSliderValue7(double newValue) {
    currentSliderValue7 = newValue;
    notifyListeners();
  }

  /// Internal Services UUID allowed (whitelist)

  static const Map<String, String> _allowedUUIDs = {
    'beb5483e-36e1-4688-b7f5-ea07361b26a8': 'Heart Rate',
    '8bdf0a1a-a48e-4dc3-8bab-ad0c1f7ed218': 'Temperature',
    '411fcc1c-e7a5-4a61-82fe-0004993dd1f4': 'SP02',
    'c608f523-aa19-40d1-8359-ad43409c34d7': 'Systolic Preasure',
    '52294b4d-d66e-4d68-9782-1e5bb8f7ba14': 'Diastolic Preasure',
    '7533653f-6f0e-41fa-8fa6-9892a1904db1': 'Frecuency',
    '607a2edc-007d-4d51-a3a6-58fad0db3c37': 'CO2',
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
      await service.characteristics[0].write([currentSliderValue1.toInt()], withoutResponse: true);
      await service.characteristics[1].write([currentSliderValue2.toInt()], withoutResponse: true);
      await service.characteristics[2].write([currentSliderValue3.toInt()], withoutResponse: true);
      await service.characteristics[3].write([currentSliderValue4.toInt()], withoutResponse: true);
      await service.characteristics[4].write([currentSliderValue5.toInt()], withoutResponse: true);
      await service.characteristics[5].write([currentSliderValue6.toInt()], withoutResponse: true);
      await service.characteristics[6].write([currentSliderValue7.toInt()], withoutResponse: true);
    }
    writeCharacteristic();

    Iterable<Stream<BLEWrite>> streams = listBle
        .map(
          (c) => c.value.map((event) {
            String value = String.fromCharCodes(event);
            String uuid = c.uuid.toString();
            return BLEWrite(_allowedUUIDs[uuid]!, value);
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
