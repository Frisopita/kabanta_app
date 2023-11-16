// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/providers/states.dart';
import 'package:kabanta_app1/providers/timer.dart';
import 'package:kabanta_app1/pages/clock.dart';
import 'package:kabanta_app1/providers/clock_provider.dart';
import 'package:provider/provider.dart';
import '../variables.dart';
import 'package:kabanta_app1/providers/sliders.dart';

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
  double states = 0;
  // Duration? firstDuration = Duration.zero; // Nueva variable

  @override
  Widget build(BuildContext context) {
    List<BluetoothCharacteristic> characteristics = widget.service.characteristics.toList();
    if (characteristics.isNotEmpty) {
      if (excludedServiceUUIDs.contains(widget.service.uuid.toString())) {
        return Container(); // Oculta el servicio
      } else {
        return ConstrainedBox(
          constraints: BoxConstraints.tight(const Size(400, 40)),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 35,
            ),
            itemBuilder: (context, index) {
              final value = index + 1;
              String statesText = '';
              switch (value) {
                case 1:
                  statesText = buttECG1;
                  break;
                case 2:
                  statesText = buttECG2;
                  break;
                case 3:
                  statesText = buttECG3;
                  break;
                default:
                  statesText = '';
                  break;
              }

              return switch (value) {
                >= 1 && <= 3 => GestureDetector(
                    onTap: () {
                      setState(() {
                        states = value.toDouble();
                        Provider.of<BleStateProvider>(context, listen: false)
                            .updatestates(states);
                      });
                      context
                          .read<BleStateProvider>()
                          .initService(widget.service);
                      widget.onTap();
                    },
                    onLongPress: () {
                      final service = context.read<ClockService>();
                      // Muestra el AlertDialog al dejar presionado
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('SCENARY SCHEDULER'),
                            content: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                        'Al hacer un click largo se despliegan la informacion de los datos enviados, ejemplo: '),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
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
                                        setState(() {
                                          states = value.toDouble();
                                        });
                                        if (result == null || !mounted) return;
                                        service.addState((
                                          duration: result,
                                          type: states,
                                          servicetest: widget.service
                                        ));
                                      },
                                      child: const Text('PROGRAM'),
                                    ),
                              TextButton(
                                style: ElevatedButton.styleFrom(
                                          backgroundColor: colorbackbutt2,
                                          foregroundColor: colorforebutt2),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Cierra el AlertDialog
                                },
                                child: const Text('BACK'),
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
                          statesText,
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
  double states = 0;

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
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 35,
            ),
            itemBuilder: (context, index) {
              final value = index + 4;
              String statesText = '';
              switch (value) {
                case 4:
                  statesText = buttECG4;
                  break;
                case 5:
                  statesText = buttECG5;
                  break;
                case 6:
                  statesText = buttECG6;
                  break;
                case 7:
                  statesText = buttECG7;
                  break;
                case 8:
                  statesText = buttECG8;
                  break;
                case 9:
                  statesText = buttECG9;
                  break;
                default:
                  statesText = '';
                  break;
              }

              return switch (value) {
                >= 4 && <= 9 => GestureDetector(
                    onTap: () {
                      setState(() {
                        states = value.toDouble();
                        Provider.of<BleStateProvider>(context, listen: false)
                            .updatestates(states);
                      });
                      context
                          .read<BleStateProvider>()
                          .initService(widget.service);
                      widget.onTap();
                    },
                    onLongPress: () {
                      final service = context.read<ClockService>();
                      // Muestra el AlertDialog al dejar presionado
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('SCENARY SCHEDULER'),
                            content: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                        'Al hacer un click largo se despliegan la informacion de los datos enviados, ejemplo: '),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: colorbackbutt2,
                                          foregroundColor: colorforebutt2),
                                      onPressed: () async {
                                        setState(() {
                                          states = value.toDouble();
                                        });
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
                                          type: states,
                                          servicetest: widget.service
                                        ));
                                      },
                                      child: const Text('PROGRAM'),
                                    ),
                              TextButton(
                                style: ElevatedButton.styleFrom(
                                          backgroundColor: colorbackbutt2,
                                          foregroundColor: colorforebutt2),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Cierra el AlertDialog
                                },
                                child: const Text('BACK'),
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
                          statesText,
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
  double states = 0;
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
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 35,
            ),
            itemBuilder: (context, index) {
              final value = index + 10;
              String statesText = '';
              switch (value) {
                case 10:
                  statesText = buttECG10;
                  break;
                case 11:
                  statesText = buttECG11;
                  break;
                case 12:
                  statesText = buttECG12;
                  break;
                case 13:
                  statesText = buttECG13;
                  break;
                case 14:
                  statesText = buttECG14;
                  break;
                case 15:
                  statesText = buttECG15;
                  break;
                case 16:
                  statesText = buttECG16;
                  break;
                case 17:
                  statesText = buttECG17;
                  break;
                case 18:
                  statesText = buttECG18;
                  break;
                default:
                  statesText = '';
                  break;
              }

              return switch (value) {
                >= 10 && <= 18 => GestureDetector(
                    onTap: () {
                      setState(() {
                        states = value.toDouble();
                        Provider.of<BleStateProvider>(context, listen: false)
                            .updatestates(states);
                      });
                      context
                          .read<BleStateProvider>()
                          .initService(widget.service);
                      widget.onTap();
                    },
                    onLongPress: () {
                      final service = context.read<ClockService>();
                      // Muestra el AlertDialog al dejar presionado
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('SCENARY SCHEDULER'),
                            content: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                        'Al hacer un click largo se despliegan la informacion de los datos enviados, ejemplo: '),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              
                                  TextButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: colorbackbutt2,
                                          foregroundColor: colorforebutt2),
                                      onPressed: () async {
                                        setState(() {
                                          states = value.toDouble();
                                        });
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
                                          type: states,
                                          servicetest: widget.service
                                        ));
                                      },
                                      child: const Text('Program'),
                                    ),
                                
                              TextButton(
                                style: ElevatedButton.styleFrom(
                                          backgroundColor: colorbackbutt2,
                                          foregroundColor: colorforebutt2),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Cierra el AlertDialog
                                },
                                child: const Text('BACK'),
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
                          statesText,
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
  double states = 0;
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
              states = 19;
              Provider.of<BleStateProvider>(context, listen: false)
                  .updatestates(states);
            });
            context.read<BleStateProvider>().initService(widget.service);
            //context.read<BleStateProvider>().updateCharacteristicState(states);
            widget.onTap();
          },
          onLongPress: () {
            final service = context.read<ClockService>();
            // Muestra el AlertDialog al dejar presionado
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('SCENARY SCHEDULER'),
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                              'Add ___ to timed scenarios '),
                        ),
                        
                      ],
                    ),
                  ),
                  actions: [
                    
                          TextButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colorbackbutt2,
                                foregroundColor: colorforebutt2),
                            onPressed: () async {
                              setState(() {
                                states = 19;
                              });
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
                                type: states,
                                servicetest: widget.service
                              ));
                            },
                            child: const Text('PROGRAM'),
                          ),
                        
                    TextButton(
                      style: ElevatedButton.styleFrom(
                                backgroundColor: colorbackbutt2,
                                foregroundColor: colorforebutt2),
                      onPressed: () {
                        Navigator.of(context).pop(); // Cierra el AlertDialog
                      },
                      child: const Text('BACK'),
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
            child: Center(
              child: Text(
                buttECG19,
                style: const TextStyle(
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
          },
          child: const Text('Upgrade'),
        );
      }
    } else {
      return Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class PlayButt extends StatefulWidget {
  final BluetoothService service;

  const PlayButt({Key? key, required this.service}) : super(key: key);

  @override
  State<PlayButt> createState() => _PlayButtState();
}

class _PlayButtState extends State<PlayButt> {
  double times = 0;
  @override
  Widget build(BuildContext context) {
    List<BluetoothCharacteristic> characteristics =
        widget.service.characteristics.toList();
    if (characteristics.isNotEmpty) {
      if (excludedServiceUUIDs.contains(widget.service.uuid.toString())) {
        return Container(); // Oculta el servicio
      } else {
        return IconButton(
          icon: const Icon(Icons.pause),
          onPressed: () {
            setState(() {
              times = 1;
            });
            context.read<BleTimesProvider>().updateTimer(times);
          },
        );
      }
    } else {
      return Text(
          '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}
