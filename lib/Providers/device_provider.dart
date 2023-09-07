import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceProvider extends ChangeNotifier {
  late BluetoothDevice device;
  List<BluetoothService> _services = const [];

  List<BluetoothService> get service => _services;

  void setDevice(BluetoothDevice d, List<BluetoothService> services) {
    device = d;
    _services = UnmodifiableListView(services);
    notifyListeners();
  }
}
