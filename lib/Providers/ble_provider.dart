import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/variables.dart';

class BLE {
  final String id;
  final String data;

  const BLE(this.id, this.data);
}

class BleProvider extends ChangeNotifier {
  Stream<List<BLE>> _stream = const Stream.empty();

  Stream<List<BLE>> get stream => _stream;

  set id(String id) {}
  void setValue(Uint8List readValues) {}

  Future <void> initService(BluetoothService service) async {
    
    List<BluetoothCharacteristic> listBle = service.characteristics
        .where((c) => allowedUUIDs.containsKey(c.uuid.toString())).toList();

    await Future.forEach(listBle, (element) => element.setNotifyValue(true));

    Future.forEach(listBle, (element) => element.onValueChangedStream.listen((value)async{}));  

    listBle.removeLast();
    Iterable<Stream<BLE>> streams = listBle
        .map(
          (c) => c.value.map((event) {
            String value = String.fromCharCodes(event);
            String uuid = c.uuid.toString();
            return BLE(allowedUUIDs[uuid]!, value);
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


