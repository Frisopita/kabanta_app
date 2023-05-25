//Test de kabanta UX

import 'package:flutter/material.dart';
import 'package:kabanta_app1/Pages/ECG.dart';
import 'package:kabanta_app1/Pages/History.dart';
import 'package:kabanta_app1/Pages/Scenery.dart';
import 'package:kabanta_app1/Pages/Vital.dart';

void main() {
  runApp(const MyKabantaApp());
}

// Inicializaci¨®n de la APP
class MyKabantaApp extends StatefulWidget {
  const MyKabantaApp({super.key});
  @override
  State<MyKabantaApp> createState() => _MyKabantaAppState();
}

class _MyKabantaAppState extends State<MyKabantaApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: DataPage(),
        );
  }
}

//Data main screen

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

  int currentIndex= 0;

  final List<Widget> _widgetOptions = <Widget> [
    const ECG(),
    const Vital(),
    const Scenery(),
    const History(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[currentIndex],
      //Botones de Navegaci¨®n
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
      //ECG Button
         BottomNavigationBarItem(
          label: 'ECG',
          icon: Icon(
            Icons.monitor_heart,
            color: currentIndex == 0 ? Colors.blueGrey : Colors.black
          ),
         ),
      //Vital Button
          BottomNavigationBarItem(
          label: 'Vital Signs',
          icon: Icon(
            Icons.accessibility_new,
            color: currentIndex == 1 ? Colors.blueGrey : Colors.black
          ),
          ),
      //Scenery Button
          BottomNavigationBarItem(
          label: 'Scenery',
          icon: Icon(
            Icons.tag,
            color: currentIndex == 2 ?  Colors.blueGrey : Colors.black
          ),
          ),
      //History Button
          BottomNavigationBarItem(
          label: 'History',
          icon: Icon(
            Icons.history,
            color: currentIndex == 3 ? Colors.blueGrey : Colors.black
          ),
          ),
       ],
      selectedItemColor: Colors.blueGrey,
      ), 
    );
  }
}
