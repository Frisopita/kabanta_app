// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/variables.dart';
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

  List<Widget> _buildNSButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => NSButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildBSButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => BSButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildTSButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => TSButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildFAButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => FAButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildTS2Butt(List<BluetoothService> services) {
    return services
        .map(
          (s) => TS2Butt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildTVDButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => TVDButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildFLUButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => FLUButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildTSVButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => TSVButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildTVMButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => TVMButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildBS0Butt(List<BluetoothService> services) {
    return services
        .map(
          (s) => BS0Butt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildBAVIButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => BAVIButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildBAVIIButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => BAVIIButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

   List<Widget> _buildBAVIIIButt(List<BluetoothService> services) {
    return services
        .map(
          (s) => BAVIIIButt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildB1Butt(List<BluetoothService> services) {
    return services
        .map(
          (s) => B1Butt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildB2Butt(List<BluetoothService> services) {
    return services
        .map(
          (s) => B2Butt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildB3Butt(List<BluetoothService> services) {
    return services
        .map(
          (s) => B3Butt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildB4Butt(List<BluetoothService> services) {
    return services
        .map(
          (s) => B4Butt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

   List<Widget> _buildB5Butt(List<BluetoothService> services) {
    return services
        .map(
          (s) => B5Butt(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildButtons(List<BluetoothService> services) {
    return services
        .map(
          (s) => TestButtonsConstrains(
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
                          padding: EdgeInsets.fromLTRB(
                              spaceleft, spacetop, spaceright, spacebott),
                          child: StreamBuilder<List<BluetoothService>>(
                            //recibe la lista de servicios (services) del dispositivo
                            stream: widget.device.services,
                            initialData: const [],
                            builder: (c, snapshot) {
                              return Column(
                                children: _buildNSButt(snapshot
                                    .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                              );
                            },
                            //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                          ),
                        ),
                        //Boton 2
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              spaceleft, spacetop, spaceright, spacebott),
                          child: StreamBuilder<List<BluetoothService>>(
                            //recibe la lista de servicios (services) del dispositivo
                            stream: widget.device.services,
                            initialData: const [],
                            builder: (c, snapshot) {
                              return Column(
                                children: _buildBSButt(snapshot
                                    .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                              );
                            },
                            //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                          ),
                        ),
                        //Boton 3
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              spaceleft, spacetop, spaceright, spacebott),
                          child: StreamBuilder<List<BluetoothService>>(
                            //recibe la lista de servicios (services) del dispositivo
                            stream: widget.device.services,
                            initialData: const [],
                            builder: (c, snapshot) {
                              return Column(
                                children: _buildTSButt(snapshot
                                    .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                              );
                            },
                            //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Boton 4
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildFAButt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                            //Boton 5
                           Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildTS2Butt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                            //Boton 6
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildTVDButt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                          ],
                        ),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Boton 7
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildFLUButt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                            //Boton 8
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildTSVButt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                            //Boton 9
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildTVMButt(snapshot
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
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildBS0Butt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                            //Boton 11
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildBAVIButt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                            //Boton 12
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildBAVIIButt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
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
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildBAVIIIButt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                            //Boton 14
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildB1Butt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                            //Boton 15
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildB2Butt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
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
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildB3Butt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                            //Boton 17
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildB4Butt(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                              ),
                            ),
                            //Boton 18
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  spaceleft, spacetop, spaceright, spacebott),
                              child: StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildB5Butt(snapshot
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
                    padding: const EdgeInsets.all(10),
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
                       StreamBuilder<List<BluetoothService>>(
                                //recibe la lista de servicios (services) del dispositivo
                                stream: widget.device.services,
                                initialData: const [],
                                builder: (c, snapshot) {
                                  return Column(
                                    children: _buildButtons(snapshot
                                        .data!), //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                  );
                                },
                                //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
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
