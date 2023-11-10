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

  // Verificar si quedan servicios despu¨¦s de la exclusi¨®n
  if (filteredServices.isEmpty) {
    // Manejar el caso en el que no hay servicios despu¨¦s de la exclusi¨®n
    throw Exception("No hay servicios disponibles despu¨¦s de excluir los servicios espec¨ªficos.");
  }

  // Tomar el primer servicio restante
  service = filteredServices.first;
  notifyListeners();
}


  /*void setService(List<BluetoothService> services) {
    // Busca el servicio que est¨¢ conectado al dispositivo y establece service
    for (BluetoothService s in services) {
      if (s.deviceId == device.id) {
        service = s;
        break;
      }
    }
    notifyListeners();
  }*/
}
