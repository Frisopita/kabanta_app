import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BLEWriteTimes {
  final String id;
  final String data;

  const BLEWriteTimes(this.id, this.data);
}

class BleTimesProvider extends ChangeNotifier {

  late double times; 
  BluetoothService? _service;

  BleTimesProvider([this.times = 0]);

  void updatetimes(double newValue) {
    times = newValue;
    notifyListeners();
  }

  Future<void> updateTimer(double newValue) async {
    final s = _service;
    if ((s ==null)) return;
    return s.characteristics[7].write([newValue.toInt()], withoutResponse: true);
  }

  /// No importan, pero da error en el widget que dejamos de usar y no lo borre
  set id(String id) {}
  void setValue(Uint8List readValues) {}


  String get debug {
    return '''

    ''';
  }
  
}
