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

class FirstWidgetButtons extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const FirstWidgetButtons(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<FirstWidgetButtons> createState() => _FirstWidgetButtonsState();
}

class _FirstWidgetButtonsState extends State<FirstWidgetButtons> {
  @override
  Widget build(BuildContext context) {
    List<BluetoothCharacteristic> characteristics =
        widget.service.characteristics.toList();
    if (characteristics.isNotEmpty) {
      if (excludedServiceUUIDs.contains(widget.service.uuid.toString())) {
        return Container(); // Oculta el servicio
      } else {
        return ConstrainedBox(
          constraints: BoxConstraints.tight(const Size(400, 40)),
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 35,
            ),
            itemBuilder: (context, index) {
              final value = index;
              String stateText = '';
              switch (value) {
                case 0:
                  stateText = buttECG1;
                  break;
                case 1:
                  stateText = buttECG2;
                  break;
                case 2:
                  stateText = buttECG3;
                  break;
                // Agrega m¨¢s casos seg¨²n sea necesario
                default:
                  stateText = '';
                  break;
              }

              return switch (index) {
                < 3 => GestureDetector(
                    onTap: () {
                      setState(() {
                        state1 = value.toDouble();
                      });
                      // Muestra el AlertDialog al hacer clic
                      context
                          .read<BleStateProvider>()
                          .initService(widget.service);
                      Provider.of<BleStateProvider>(context, listen: false)
                          .updateState1(state1);
                      widget.onTap();
                    },
                    onLongPress: () {
                      final service = context.read<ClockService>();
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
                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: colorbackbutt2,
                                          foregroundColor: colorforebutt2),
                                      onPressed: () async {
                                        final Duration? result =
                                            await Navigator.push<Duration?>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const ClockConfigScreen(),
                                          ),
                                        );
                                        if (result == null || !mounted) return;
                                        service.addState((
                                          duration: result,
                                          id: state1,
                                        ));
                                        setState(() {
                                          state1 = value.toDouble();
                                        });
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
                                  Navigator.of(context)
                                      .pop(); // Cierra el AlertDialog
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
                          stateText,
                          style: TextStyle(
                              color: colorforebutt1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                _ => const SizedBox(),
              };
            },
            itemCount: 3,
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class SecondWidgetButtons extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const SecondWidgetButtons(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<SecondWidgetButtons> createState() => _SecondWidgetButtonsState();
}

class _SecondWidgetButtonsState extends State<SecondWidgetButtons> {
  @override
  Widget build(BuildContext context) {
    List<BluetoothCharacteristic> characteristics =
        widget.service.characteristics.toList();
    if (characteristics.isNotEmpty) {
      if (excludedServiceUUIDs.contains(widget.service.uuid.toString())) {
        return Container(); // Oculta el servicio
      } else {
        return ConstrainedBox(
          constraints: BoxConstraints.tight(const Size(400, 80)),
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 35,
            ),
            itemBuilder: (context, index) {
              final value = index + 3;
              String stateText = '';
              switch (value) {
                case 3:
                  stateText = buttECG3;
                  break;
                case 4:
                  stateText = buttECG4;
                  break;
                case 5:
                  stateText = buttECG5;
                  break;
                case 6:
                  stateText = buttECG6;
                  break;
                case 7:
                  stateText = buttECG7;
                  break;
                case 8:
                  stateText = buttECG8;
                  break;
                // Agrega m¨¢s casos seg¨²n sea necesario
                default:
                  stateText = '';
                  break;
              }

              return switch (index) {
                < 6 => GestureDetector(
                    onTap: () {
                      setState(() {
                        state1 = value.toDouble();
                      });
                      // Muestra el AlertDialog al hacer clic
                      context
                          .read<BleStateProvider>()
                          .initService(widget.service);
                      Provider.of<BleStateProvider>(context, listen: false)
                          .updateState1(state1);
                      widget.onTap();
                    },
                    onLongPress: () {
                      final service = context.read<ClockService>();
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
                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: colorbackbutt2,
                                          foregroundColor: colorforebutt2),
                                      onPressed: () async {
                                        final Duration? result =
                                            await Navigator.push<Duration?>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const ClockConfigScreen(),
                                          ),
                                        );
                                        if (result == null || !mounted) return;
                                        service.addState((
                                          duration: result,
                                          id: state1,
                                        ));
                                        setState(() {
                                          state1 = value.toDouble();
                                        });
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
                                  Navigator.of(context)
                                      .pop(); // Cierra el AlertDialog
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
                          stateText,
                          style: TextStyle(
                              color: colorforebutt2,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                _ => const SizedBox(),
              };
            },
            itemCount: 6,
          ),
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class ThirdWidgetButtons extends StatefulWidget {
  final BluetoothService service;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const ThirdWidgetButtons(
      {Key? key,
      required this.service,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<ThirdWidgetButtons> createState() => _ThirdWidgetButtonsState();
}

class _ThirdWidgetButtonsState extends State<ThirdWidgetButtons> {
  @override
  Widget build(BuildContext context) {
    List<BluetoothCharacteristic> characteristics =
        widget.service.characteristics.toList();
    if (characteristics.isNotEmpty) {
      if (excludedServiceUUIDs.contains(widget.service.uuid.toString())) {
        return Container(); // Oculta el servicio
      } else {
        return ConstrainedBox(
          constraints: BoxConstraints.tight(const Size(400, 130)),
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 35,
            ),
            itemBuilder: (context, index) {
              final value = index + 9;
              String stateText = '';
              switch (value) {
                case 9:
                  stateText = buttECG9;
                  break;
                case 10:
                  stateText = buttECG10;
                  break;
                case 11:
                  stateText = buttECG11;
                  break;
                case 12:
                  stateText = buttECG12;
                  break;
                case 13:
                  stateText = buttECG13;
                  break;
                case 14:
                  stateText = buttECG14;
                  break;
                case 15:
                  stateText = buttECG15;
                  break;
                case 16:
                  stateText = buttECG16;
                  break;
                case 17:
                  stateText = buttECG17;
                  break;
                // Agrega m¨¢s casos seg¨²n sea necesario
                default:
                  stateText = '';
                  break;
              }

              return switch (index) {
                < 9 => GestureDetector(
                    onTap: () {
                      setState(() {
                        state1 = value.toDouble();
                      });
                      // Muestra el AlertDialog al hacer clic
                      context
                          .read<BleStateProvider>()
                          .initService(widget.service);
                      Provider.of<BleStateProvider>(context, listen: false)
                          .updateState1(state1);
                      widget.onTap();
                    },
                    onLongPress: () {
                      final service = context.read<ClockService>();
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
                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: colorbackbutt2,
                                          foregroundColor: colorforebutt2),
                                      onPressed: () async {
                                        final Duration? result =
                                            await Navigator.push<Duration?>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const ClockConfigScreen(),
                                          ),
                                        );
                                        if (result == null || !mounted) return;
                                        service.addState((
                                          duration: result,
                                          id: state1,
                                        ));
                                        setState(() {
                                          state1 = value.toDouble();
                                        });
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
                                  Navigator.of(context)
                                      .pop(); // Cierra el AlertDialog
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
                          stateText,
                          style: TextStyle(
                              color: colorforebutt2,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                _ => const SizedBox(),
              };
            },
            itemCount: 9,
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
            final service = context.read<ClockService>();
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
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colorbackbutt2,
                                foregroundColor: colorforebutt2),
                            onPressed: () async {
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
                              setState(() {
                                state1 = 1;
                              });
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
