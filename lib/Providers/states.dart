import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/variables.dart';

class BLEWriteStates {
  final String id;
  final String data;

  const BLEWriteStates(this.id, this.data);
}

class BleStateProvider extends ChangeNotifier {
  Stream<List<BLEWriteStates>> _stream = const Stream.empty();

  Stream<List<BLEWriteStates>> get stream => _stream;

  late double state1; 
  BluetoothService? _service;

  BleStateProvider([this.state1 = 0]);

  void updateState1(double newValue) {
    state1 = newValue;
    notifyListeners();
  }

  Future<void> updateCharacteristic(double newValue) async {
    final s = _service;
    if ((s ==null)) return;
    return s.characteristics[8].write([newValue.toInt()], withoutResponse: true);
  }

  /// No importan, pero da error en el widget que dejamos de usar y no lo borre
  set id(String id) {}
  void setValue(Uint8List readValues) {}

  Future <void> initService(BluetoothService service) async {
    _service = service;
    List<BluetoothCharacteristic> listBle = service.characteristics
        .where((c) => allowedUUIDs.containsKey(c.uuid.toString())).toList();

    await Future.forEach(listBle, (element) => element.setNotifyValue(true));

    Future<void> writeCharacteristic() async {
      await service.characteristics[8].write([state1.toInt()], withoutResponse: true);
    }
    writeCharacteristic();

    listBle.removeLast();
    Iterable<Stream<BLEWriteStates>> streams = listBle
        .map(
          (c) => c.value.map((event) {
            String value = String.fromCharCodes(event);
            String uuid = c.uuid.toString();
            return BLEWriteStates(allowedUUIDs[uuid]!, value);
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


