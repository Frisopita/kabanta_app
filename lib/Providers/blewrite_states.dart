import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BLEWriteStates {
  final String id;
  final String data;

  const BLEWriteStates(this.id, this.data);
}

class BleStateProvider extends ChangeNotifier {
  Stream<List<BLEWriteStates>> _stream = const Stream.empty();

  Stream<List<BLEWriteStates>> get stream => _stream;

  late double state1; 

  BleStateProvider(
    this.state1,
  );

    void updateState1(double newState) {
    state1 = newState;
    print('hola');
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
    'aea7aac8-5a97-488e-bd01-4166d22ec81e': 'Timer',
  '2a1c9f0b-78c4-4e0f-adc1-5dea4a248344': 'State',
  
  };
  
  /// No importan, pero da error en el widget que dejamos de usar y no lo borre
  set id(String id) {}
  void setValue(Uint8List readValues) {}

  Future <void> initService(BluetoothService service) async {
    
    List<BluetoothCharacteristic> listBle = service.characteristics
        .where((c) => _allowedUUIDs.containsKey(c.uuid.toString())).toList();

    await Future.forEach(listBle, (element) => element.setNotifyValue(true));

    Future<void> writeCharacteristic() async {
      await service.characteristics[8].write([100.toInt()], withoutResponse: true);
      print('jiji');
    }
    writeCharacteristic();

    listBle.removeLast();
    Iterable<Stream<BLEWriteStates>> streams = listBle
        .map(
          (c) => c.value.map((event) {
            String value = String.fromCharCodes(event);
            String uuid = c.uuid.toString();
            return BLEWriteStates(_allowedUUIDs[uuid]!, value);
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


