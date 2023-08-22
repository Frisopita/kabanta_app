// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/Providers/states.dart';
import 'package:kabanta_app1/pages/clock.dart';
import 'package:kabanta_app1/providers/clock_provider.dart';
import 'package:provider/provider.dart';
import '../variables.dart';
import 'package:kabanta_app1/Providers/sliders.dart';

bool _isButtonLongPressed = false;

final List<String> excludedServiceUUIDs = [
  '00001800-0000-1000-8000-00805f9b34fb',
  '00001801-0000-1000-8000-00805f9b34fb'
];

class NSButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const NSButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<NSButt> createState() => _NSButtState();
}

class _NSButtState extends State<NSButt> {
  @override
  Widget build(BuildContext context) {
    List<BluetoothCharacteristic> characteristics =
        widget.service.characteristics.toList();
    if (characteristics.isNotEmpty) {
      if (excludedServiceUUIDs.contains(widget.service.uuid.toString())) {
        return Container(); // Oculta el servicio
      } else {
        return InkWell(
          onTap: () {
            setState(() {
              state1 = 0;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt1,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'NS',
                style: TextStyle(
                    color: colorforebutt1, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class BSButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const BSButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<BSButt> createState() => _BSButtState();
}

class _BSButtState extends State<BSButt> {
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
            setState(() {
              state1 = 1;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt1,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'BS',
                style: TextStyle(
                    color: colorforebutt1, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class TSButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const TSButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<TSButt> createState() => _TSButtState();
}

class _TSButtState extends State<TSButt> {
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
            setState(() {
              state1 = 2;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt1,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'TS',
                style: TextStyle(
                    color: colorforebutt1, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class FAButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const FAButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<FAButt> createState() => _FAButtState();
}

class _FAButtState extends State<FAButt> {
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
            setState(() {
              state1 = 3;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'FA',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class TS2Butt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const TS2Butt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<TS2Butt> createState() => _TS2ButtState();
}

class _TS2ButtState extends State<TS2Butt> {
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
            setState(() {
              state1 = 4;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'TS',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class TVDButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const TVDButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<TVDButt> createState() => _TVDButtState();
}

class _TVDButtState extends State<TVDButt> {
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
            setState(() {
              state1 = 5;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'TVD',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class FLUButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const FLUButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<FLUButt> createState() => _FLUButtState();
}

class _FLUButtState extends State<FLUButt> {
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
            setState(() {
              state1 = 6;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Flutter',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class TSVButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const TSVButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<TSVButt> createState() => _TSVButtState();
}

class _TSVButtState extends State<TSVButt> {
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
            setState(() {
              state1 = 7;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'TSV',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class TVMButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const TVMButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<TVMButt> createState() => _TVMButtState();
}

class _TVMButtState extends State<TVMButt> {
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
            setState(() {
              state1 = 8;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'TVM',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class BS0Butt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const BS0Butt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<BS0Butt> createState() => _BS0ButtState();
}

class _BS0ButtState extends State<BS0Butt> {
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
            setState(() {
              state1 = 9;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'BS',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class BAVIButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const BAVIButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<BAVIButt> createState() => _BAVIButtState();
}

class _BAVIButtState extends State<BAVIButt> {
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
            setState(() {
              state1 = 10;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'BAVI',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class BAVIIButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const BAVIIButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<BAVIIButt> createState() => _BAVIIButtState();
}

class _BAVIIButtState extends State<BAVIIButt> {
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
            setState(() {
              state1 = 11;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'BAVII',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class BAVIIIButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const BAVIIIButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<BAVIIIButt> createState() => _BAVIIIButtState();
}

class _BAVIIIButtState extends State<BAVIIIButt> {
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
            setState(() {
              state1 = 12;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'BAVIII',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class B1Butt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const B1Butt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<B1Butt> createState() => _B1ButtState();
}

class _B1ButtState extends State<B1Butt> {
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
            setState(() {
              state1 = 13;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'B',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class B2Butt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const B2Butt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<B2Butt> createState() => _B2ButtState();
}

class _B2ButtState extends State<B2Butt> {
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
            setState(() {
              state1 = 14;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'B',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class B3Butt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const B3Butt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<B3Butt> createState() => _B3ButtState();
}

class _B3ButtState extends State<B3Butt> {
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
            setState(() {
              state1 = 15;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'B',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class B4Butt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const B4Butt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<B4Butt> createState() => _B4ButtState();
}

class _B4ButtState extends State<B4Butt> {
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
            setState(() {
              state1 = 16;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'B',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class B5Butt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const B5Butt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<B5Butt> createState() => _B5ButtState();
}

class _B5ButtState extends State<B5Butt> {
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
            setState(() {
              state1 = 17;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
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
              color: colorbackbutt2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'B',
                style: TextStyle(
                    color: colorforebutt2, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class HeartAttackButt extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const HeartAttackButt(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<HeartAttackButt> createState() => _HeartAttackButtState();
}

class _HeartAttackButtState extends State<HeartAttackButt> {
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
            setState(() {
              state1 = 1;
            });
            // Muestra el AlertDialog al hacer clic
            context.read<BleStateProvider>().initService(widget.service);
            Provider.of<BleStateProvider>(context, listen: false)
                .updateState1(state1);
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
                          child: Text(
                              'Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/corazon.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Heart Rate: '),
                                  Text(
                                    '250',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/temperatura.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Temperature: '),
                                  Text(
                                    '36',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/o2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('SpO2: '),
                                  Text(
                                    '70',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Sys Pressure: '),
                                  Text(
                                    '60',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pressure.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Dias Pressure: '),
                                  Text(
                                    '35',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/pulso.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('Frequency Rate: '),
                                  Text(
                                    '8',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'Icons/co2.png',
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text('CO2: '),
                                  Text(
                                    '6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              final service = context.read<ClockService>();
                              final Duration? result =
                                  await Navigator.push<Duration?>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ClockConfigScreen(),
                                ),
                              );
                              if (result == null || !mounted) return;
                              service.addState((
                                duration: result,
                                id: state1,
                              ));
                            },
                            child: const Text('Program'),
                          ),
                        ),
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
                  offset: const Offset(-1, 1),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Heart Attack',
                style: TextStyle(
                    color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
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
