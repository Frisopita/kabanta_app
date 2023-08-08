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
import 'package:kabanta_app1/Providers/qrtext_provider.dart';

final List<String> excludedServiceUUIDs = [
  '00001800-0000-1000-8000-00805f9b34fb',
  '00001801-0000-1000-8000-00805f9b34fb'
];

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
