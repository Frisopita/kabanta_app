//Test de kabanta UX
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kabanta_app1/Pages/ecg.dart';
import 'package:kabanta_app1/Pages/history.dart';
import 'package:kabanta_app1/Pages/scenery.dart';
import 'package:kabanta_app1/Pages/vital.dart';
import 'package:kabanta_app1/bluetooth.dart';
import 'package:kabanta_app1/containers.dart';
import 'package:provider/provider.dart';
import 'temp_provider.dart';
import 'widgets.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'variables.dart';

void main() {
  if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    [
      Permission.location,
      Permission.storage,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan
    ].request().then((status) {
      runApp(const MyKabantaApp());
    });
  } else {
    runApp(const MyKabantaApp());
  }
}

// Inicializaci¨®n de la APP
class MyKabantaApp extends StatelessWidget {
  const MyKabantaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TempProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.lightBlue,
        home: StreamBuilder<BluetoothState>(
            stream: FlutterBluePlus.instance.state,
            initialData: BluetoothState.unknown,
            builder: (c, snapshot) {
              final state = snapshot.data;
              if (state == BluetoothState.on) {
                return const DataPage();
              }
              return const DataPage();
              /*const Center(
                child:
                    Text('Su bluetooth esta apagado, es necesario prenderlo'),
              );*/
            }),
      ),
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
  int currentIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const ECG(),
    const Vital(),
    const Scenery(),
    const History(),
  ];

  final Widget _fixedWidgetSignal = ContainerSignal();
  final Widget _fixedWidgetClock = ContainerClock();

  // Variables para las posiciones del widget fijo
  double _fixedWidgetTop = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox appBarBox = context.findRenderObject() as RenderBox;
      setState(() {
        _fixedWidgetTop = appBarBox.size.height;
      });
    });
  }

  // Variables para las posiciones del widget fijo
  double _fixedWidgetSignalTop = 0;
  double _fixedWidgetSignalLeft = 0;
  double _fixedWidgetSignalRight = 0;
  double _fixedWidgetSignalBottom = 0;

  double _fixedWidgetClockTop = 0;
  double _fixedWidgetClockLeft = 0;
  double _fixedWidgetClockRight = 0;
  double _fixedWidgetClockBottom = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/original.png',
            fit: BoxFit.cover,
            height: 100,
            width:  130),
        backgroundColor: Colors.white,
        actions: <Widget>[
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                child: Text(
                  '00:00:00',
                  style: timeLabel,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const FindDevicesScreen(),
              ));
            },
          ),
        ],
      ),
      body:
      Stack(
        children: [
          Positioned.fill(
            child: _widgetOptions[currentIndex],),
             Positioned(
        top: _fixedWidgetClockTop,
        left: _fixedWidgetClockLeft,
        right: _fixedWidgetClockRight,
        bottom: _fixedWidgetClockBottom,
        child: _fixedWidgetClock,
      ),
       Positioned(
        top: _fixedWidgetTop,
        left: _fixedWidgetSignalLeft,
        right: _fixedWidgetSignalRight,
        bottom: _fixedWidgetSignalBottom,
        child: _fixedWidgetSignal,
      ),
        ],
      ),
     
      
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
            icon: Icon(Icons.monitor_heart,
                color: currentIndex == 0 ? Colors.blueGrey : Colors.black),
          ),
          //Vital Button
          BottomNavigationBarItem(
            label: 'Vital Signs',
            icon: Icon(Icons.accessibility_new,
                color: currentIndex == 1 ? Colors.blueGrey : Colors.black),
          ),
          //Scenery Button
          BottomNavigationBarItem(
            label: 'Scenery',
            icon: Icon(Icons.tag,
                color: currentIndex == 2 ? Colors.blueGrey : Colors.black),
          ),
          //History Button
          BottomNavigationBarItem(
            label: 'History',
            icon: Icon(Icons.history,
                color: currentIndex == 3 ? Colors.blueGrey : Colors.black),
          ),
        ],
        selectedItemColor: Colors.blueGrey,
      ),
    );
  }
}
