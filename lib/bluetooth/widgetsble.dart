// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/Providers/blewrite_states.dart';
import 'package:provider/provider.dart';
import '../variables.dart';
import 'package:kabanta_app1/Providers/blewrite_sliderprovider.dart';

final List<String> excludedServiceUUIDs = [
  '00001800-0000-1000-8000-00805f9b34fb',
  '00001801-0000-1000-8000-00805f9b34fb'
];

class HeartAttackButt extends StatefulWidget {
  final BluetoothService service;
   final VoidCallback onTap;
  final VoidCallback onLongPress;
  

  HeartAttackButt({Key? key, required this.service, required this.onTap, required this.onLongPress}) : super(key: key);

  @override
  State<HeartAttackButt> createState() => _HeartAttackButtState();
}

class _HeartAttackButtState extends State<HeartAttackButt> {
bool _isButtonLongPressed = false;

  @override
  Widget build(BuildContext context) {
    List<BluetoothCharacteristic> characteristics =
        widget.service.characteristics.toList();
    if (characteristics.isNotEmpty) {
      if (excludedServiceUUIDs.contains(widget.service.uuid.toString())) {
        return Container(); // Oculta el servicio
      } else {
        return GestureDetector(
      onTap: () {
        // Muestra el AlertDialog al hacer clic
        context.read<BleStateProvider>;
        widget.onTap();
      },
      onLongPress: () {
        // Muestra el AlertDialog al dejar presionado
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
             title: const Text('Long Click'),
              content: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                    ),
                   
                    Row(
                      children: [
                        Image.asset('Icons/corazon.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('Heart Rate: '),
                              Text('250', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/temperatura.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('Temperature: '),
                              Text('36', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/o2.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('SpO2: '),
                              Text('70', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/pressure.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('Sys Pressure: '),
                              Text('60', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/pressure.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding:  EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('Dias Pressure: '),
                              Text('35', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/pulso.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('Frequency Rate: '),
                              Text('8', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/co2.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('CO2: '),
                              Text('6', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el AlertDialog
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        setState(() {
          _isButtonLongPressed = true;
        });
        widget.onLongPress();
      },
      onLongPressUp: () {
        setState(() {
          _isButtonLongPressed = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isButtonLongPressed = false;
        });
      },
      child: Container(
        width: 95,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(-1, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            _isButtonLongPressed ? "Heart Atack" : "Heart Attack",
            style: const TextStyle(color: Colors.indigo),
          ),
        ),
      ),
    );
 
      }
    } else {
      return Text('0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
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
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorbackbutt2, foregroundColor: colorforebutt2),
          onPressed: () {
            context.read<BleWriteSliderProvider>().initService(service);
            //context.read<BleProvider>().initService(service);
            // Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: const Text('Upgrade'),
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
        return IconButton(
          icon: const Icon(Icons.pause),
          onPressed: () {
            context.read<BleWriteSliderProvider>().initService(service);
          },
        );
      }
    } else {
      return Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}
