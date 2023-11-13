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

  late double states; 
  BluetoothService? _service;

  BleStateProvider([this.states = 0]);

  void updatestates(double newValue) {
    states = newValue;
    notifyListeners();
  }

  Future<void> updateCharacteristicState(double newValue) async {
    final s = _service;
    if ((s ==null)) return;
    Future<void> writeCharacteristic() async {
      await s.characteristics[8].write([newValue.toInt()]);
    }
    writeCharacteristic();
  }

  set id(String id) {}
  void setValue(Uint8List readValues) {}

   Future <void> initService(BluetoothService service) async {
    _service = service;

    Future<void> writeCharacteristic() async {
      await service.characteristics[8].write([states.toInt()]);
      print(states);
    }
    writeCharacteristic();
    
    notifyListeners();

  }

  String get debug {
    return '''

    ''';
  }
  
}


