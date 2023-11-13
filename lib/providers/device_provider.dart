import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/bluetooth/widgetsble.dart';

class DeviceProvider extends ChangeNotifier {
  late BluetoothDevice device;
  late BluetoothService service;
  List<BluetoothService> _services = const [];

  List<BluetoothService> get services => _services;

  void setDevice(BluetoothDevice d, List<BluetoothService> services) {
    device = d;
    _services = UnmodifiableListView(services);
    notifyListeners();
  }

  void setService(List<BluetoothService> services) {
  // Filtrar los servicios excluidos
  final filteredServices = services.where((s) => !excludedServiceUUIDs.contains(s.uuid.toString()));

  // Verificar si quedan servicios después de la exclusión
  if (filteredServices.isEmpty) {
    // Manejar el caso en el que no hay servicios después de la exclusión
    throw Exception("No hay servicios disponibles después de excluir los servicios específicos.");
  }

  // Tomar el primer servicio restante
  service = filteredServices.first;
  notifyListeners();
}


  /*void setService(List<BluetoothService> services) {
    // Busca el servicio que está conectado al dispositivo y establece service
    for (BluetoothService s in services) {
      if (s.deviceId == device.id) {
        service = s;
        break;
      }
    }
    notifyListeners();
  }*/
}
