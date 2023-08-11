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

  /// Internal Services UUID allowed (whitelist)
  
  static const Map<String, String> _allowedUUIDs = {
  '2a1c9f0b-78c4-4e0f-adc1-5dea4a248344': 'State',
  };
  
  /// No importan, pero da error en el widget que dejamos de usar y no lo borre
  set id(String id) {}
  void setValue(Uint8List readValues) {}

  Future <void> initService(BluetoothService service) async {
    
    List<BluetoothCharacteristic> listBle = service.characteristics
        .where((c) => _allowedUUIDs.containsKey(c.uuid.toString())).toList();

    await Future.forEach(listBle, (element) => element.setNotifyValue(true));

    Future.forEach(listBle, (element) => element.onValueChangedStream.listen((value)async{}));  

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


