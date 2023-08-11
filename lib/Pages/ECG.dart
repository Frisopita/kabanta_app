// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:kabanta_app1/widgets/buttongesture.dart';
import 'package:provider/provider.dart';
import '../Providers/blewrite_states.dart';
import '../bluetooth/widgetsble.dart';

class ECG extends StatefulWidget {
  const ECG({Key? key, required this.device}) : super(key: key);
  final BluetoothDevice device;

  @override
  State<ECG> createState() => _ECGState();
}

class _ECGState extends State<ECG> {
  List<Widget> _buildHeartAttackButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => HeartAttackButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //0
          Container(
            height: 50,
            color: null,
          ),
          //1
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //1 Widget de botones
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Boton 1
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(2, spacetop, 35, spacebott),
                          child: Container(
                            width: 80,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorbackbutt1,
                                  foregroundColor: colorforebutt1),
                              onPressed: () {
                                setState(() {
                                  buttConstName = 'Clicked';
                                });
                                print('Holiwis');
                              },
                              child: Text(buttECG1),
                            ),
                          ),
                        ),
                        //Boton 2
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              spaceleft, spacetop, spaceright, spacebott),
                          child: Container(
                            width: 95,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorbackbutt1,
                                  foregroundColor: colorforebutt1),
                              onPressed: () {
                                setState(() {
                                  buttConstName = 'Clicked';
                                });
                                print('Holiwis');
                              },
                              child: Text(buttECG2),
                            ),
                          ),
                        ),
                        //Boton 3
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              spaceleft, spacetop, spaceright, spacebott),
                          child: Container(
                            width: 95,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorbackbutt1,
                                  foregroundColor: colorforebutt1),
                              onPressed: () {
                                setState(() {
                                  buttConstName = 'Clicked';
                                });
                                print('Holiwis');
                              },
                              child: Text(buttECG3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //2 First Title
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        18, spacetop, spaceright, spacebott),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'TACHYCARDIA',
                        style: titleLabel,
                      ),
                    ),
                  ),
                  //3 First Line
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Container(
                      height: 1, // Altura de la l��nea de separaci��n
                      color: Colors.grey, // Color de la l��nea de separaci��n
                    ),
                  ),
                  //4 First Button Widget
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            //Boton 4
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    state1 = 0;
                                    Provider.of<BleStateProvider>(context, listen: false).state1;
                                    
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG4),
                                ),
                              ),
                            ),
                            //Boton 5
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            //Boton 6
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG6),
                                ),
                              ),
                            ),
                            //Boton 7
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG7),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            //Boton 8
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG8),
                                ),
                              ),
                            ),
                            //Boton 9
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG9),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //5 Second Title
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        18, spacetop, spaceright, spacebott),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'BRADYCARDIA',
                        style: titleLabel,
                      ),
                    ),
                  ),
                  //6 Second Line
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Container(
                      height: 1, // Altura de la l��nea de separaci��n
                      color: Colors.grey, // Color de la l��nea de separaci��n
                    ),
                  ),
                  //7 Second Buttons Widget
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Boton 10
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG10),
                                ),
                              ),
                            ),
                            //Boton 11
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG11),
                                ),
                              ),
                            ),
                            //Boton 12
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Boton 13
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG13),
                                ),
                              ),
                            ),
                            //Boton 14
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG14),
                                ),
                              ),
                            ),
                            //Boton 15
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG15),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Boton 16
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG16),
                                ),
                              ),
                            ),
                            //Boton 17
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG17),
                                ),
                              ),
                            ),
                            //Boton 18
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: colorbackbutt2,
                                      foregroundColor: colorforebutt2),
                                  onPressed: () {
                                    setState(() {
                                      buttConstName = 'Clicked';
                                    });
                                    print('Holiwis');
                                  },
                                  child: Text(buttECG18),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Row de prueba
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: DualActionButton(
                                onTap: () {
                                  // Acci��n al hacer clic
                                  print('Button tapped!');
                                },
                                onLongPress: () {
                                  // Acci��n al dejar presionado
                                  print('Button long pressed!');
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: DualActionButton(
                                onTap: () {
                                  // Acci��n al hacer clic
                                  print('Button tapped!');
                                },
                                onLongPress: () {
                                  // Acci��n al dejar presionado
                                  print('Button long pressed!');
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: DualActionButton(
                                onTap: () {
                                  // Acci��n al hacer clic
                                  print('Button tapped!');
                                },
                                onLongPress: () {
                                  // Acci��n al dejar presionado
                                  print('Button long pressed!');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //8 Third Title
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        18, spacetop, spaceright, spacebott),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'HEART ATTACK',
                        style: titleLabel,
                      ),
                    ),
                  ),
                  //3 Third Line
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Container(
                      height: 1, // Altura de la l��nea de separaci��n
                      color: Colors.grey, // Color de la l��nea de separaci��n
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        //Row de prueba
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildHeartAttackButt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          //2
          Container(
            height: 80,
            color: null,
          ),
        ],
      ),
    );
  }
}
