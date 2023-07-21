// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/main.dart';
import 'package:provider/provider.dart';
import '../variables.dart';
import 'package:kabanta_app1/Providers/blewrite_sliderprovider.dart';
import 'package:kabanta_app1/Providers/device_provider.dart';

final List<String> excludedServiceUUIDs = [
  '00001800-0000-1000-8000-00805f9b34fb',
  '00001801-0000-1000-8000-00805f9b34fb'
];

class ScanResultTile extends StatefulWidget {
  const ScanResultTile({Key? key, required this.result})
      : super(key: key);

  final ScanResult result;

  @override
  State<ScanResultTile> createState() => _ScanResultTileState();
}

class _ScanResultTileState extends State<ScanResultTile> {
  bool isConnected = false;

  Future<void> _connectToDevice() async {
    if (widget.result.device.name == 'ESP32 Sopita' && !isConnected) {
      await widget.result.device.connect();
      List<BluetoothService> services = await widget.result.device.discoverServices();

      setState(() {
        isConnected = true;
      });
      Provider.of<DeviceProvider>(context, listen: false)
          .setDevice(widget.result.device);
          
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DataPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _connectToDevice(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras se est¨¢ conectando, puedes mostrar un indicador de carga
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: CircularProgressIndicator(
                  color: Colors.indigo,
                  backgroundColor: Colors.blueGrey.shade100,
                  value: .5,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Conectando con ESP32 Sopita'),
              ),
            ],
          );
        } else {
          if (widget.result.advertisementData.connectable) {
            if (widget.result.device.name.isNotEmpty) {
              // Si el nombre del dispositivo coincide con el deseado y est¨¢ conectado, muestra el ListTile
              if (widget.result.device.name == 'ESP32 Sopita' && isConnected) {
                return Container();
              } else {
                // Si el nombre del dispositivo no coincide con el deseado o a¨²n no est¨¢ conectado, devuelve un contenedor vac¨ªo
                return Container();
              }
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        }
      },
    );
  }
}


class UppgradeButt extends StatelessWidget {
  final BluetoothService service;

  const UppgradeButt({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BluetoothCharacteristic> characteristics =
        service.characteristics.toList();
    if (characteristics.isNotEmpty) {
      if (excludedServiceUUIDs.contains(service.uuid.toString())) {
        return Container(); // Oculta el servicio
      } else {
        return Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorbackbutt2,
                      foregroundColor: colorforebutt2),
                  onPressed: () {
                    context.read<BleWriteSliderProvider>().initService(service);
                    //context.read<BleProvider>().initService(service);
                    // Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text('Upgrade'),
                ),
              ],
            ),
          ],
        );
      }
    } else {
      return Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}


class PlayButt extends StatelessWidget {
  final BluetoothService service;

  const PlayButt({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BluetoothCharacteristic> characteristics =
        service.characteristics.toList();
    if (characteristics.isNotEmpty) {
      if (excludedServiceUUIDs.contains(service.uuid.toString())) {
        return Container(); // Oculta el servicio
      } else {
        return Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[  
                IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () {
                  context.read<BleWriteSliderProvider>().initService(service);
                },
              ),      
              ],
            ),
          ],
        );
      }
    } else {
      return Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

