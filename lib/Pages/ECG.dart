// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/providers/device_provider.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:kabanta_app1/bluetooth/widgetsble.dart';
import 'package:provider/provider.dart';

class ECG extends StatelessWidget {
  const ECG({Key? key}) : super(key: key);

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

  List<Widget> _buildFirstButtons(List<BluetoothService> services) {
    return services
        .map(
          (s) => FirstWidgetButtons(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildSecondButtons(List<BluetoothService> services) {
    return services
        .map(
          (s) => SecondWidgetButtons(
            service: s,
            onTap: () {},
            onLongPress: () {},
          ),
        )
        .toList();
  }

  List<Widget> _buildThirdButtons(List<BluetoothService> services) {
    return services
        .map(
          (s) => ThirdWidgetButtons(
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
              child: Selector<DeviceProvider, List<BluetoothService>>(
                selector: (context, deviceProvider) => deviceProvider.services,
                builder: (context, services, _) {
                  return Column(
                    children: [
                      //1 Widget de botones
                      Padding(
                        padding: const EdgeInsets.all(10),
                        //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                        child: Column(
                          //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                          children: _buildFirstButtons(services),
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
                        padding: const EdgeInsets.all(10),
                        //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                        child: Column(
                          //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                          children: _buildSecondButtons(services),
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
                        //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                        child: Column(
                          //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                          children: _buildThirdButtons(services),
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
                                    spaceleft,
                                    spacetop,
                                    spaceright,
                                    spacebott,
                                  ),
                                  //Los ServiceTile y CharacteristicTile se generan dinamicamente en funcion de los datos recibidos.
                                  child: Column(
                                    //muestra los ServiceTile generados por el metodo _buildServiceTiles.
                                    children: _buildHeartAttackButt(services),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
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
