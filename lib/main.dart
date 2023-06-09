//Test de kabanta UX
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kabanta_app1/Pages/ecg.dart';
import 'package:kabanta_app1/Pages/history.dart';
import 'package:kabanta_app1/Pages/scenery.dart';
import 'package:kabanta_app1/Pages/vital.dart';
import 'package:kabanta_app1/Providers/ble_provider.dart';
import 'package:kabanta_app1/bluetooth.dart';
import 'package:kabanta_app1/containers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as flutter_blue;
import 'package:permission_handler/permission_handler.dart';

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

// Inicializaci��n de la APP
class MyKabantaApp extends StatelessWidget {
  const MyKabantaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BleProvider>(
          /// lazy se usa para incializar un provider antes de tiempo:
          /// true: se incializa desde que se inserta en el Widget Tree
          /// false: se inicializa hasta que se utiliza por 1ra vez
          /// null: mismo que false
          lazy: null,
          //Se encarga de la notificaci��n de los cambios de provider
          create: (BuildContext context) => BleProvider(),
        ),

        /// Puedes iniciar el stream dentro de un provider y usarlo en toda la app.
        /// Lo ideal sería usar un wrapper y meter el stream dentro de un objeto o servicio que nosotros
        /// escribieramos
        StreamProvider<flutter_blue.BluetoothState>.value(
          value: flutter_blue.FlutterBluePlus.instance.state,
          initialData: flutter_blue.BluetoothState.unknown,
        ),
      ],
      child: MaterialApp(
        // Quita el banner de debug en la parte superior derecha de la pantalla
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Crimson_Text',
        ),

        home: Builder(
          builder: (context) {
            final blState = context.watch<flutter_blue.BluetoothState>();
            if (blState == flutter_blue.BluetoothState.on) {
              // Pasa los datos aqu��
              return DataPage();
            }
            return const FindDevicesScreen();
            // Si el estado de Bluetooth no est�� encendido, muestra la pantalla BluetoothOffScreen con el estado actual
          },
        ),
      ),
      builder: (context, child) {
        /// select es un caso especial que solo observa un estado dentro del objeto (Sensor)
        /// y solo actualiza el widget cuando ese valor cambia, sin importar si notifylistener() cambio otros datos de nuestro objeto
        /// ver [Selector]
        final stream = context.select<BleProvider, Stream<List<BLE>>>(
          (s) => s.stream,
        );
        return StreamProvider<List<BLE>>.value(
          value: stream,
          catchError: (context, error) {

            return [];
          },
          initialData: const [],
          child: child,
        );
      },
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

  final Widget _fixedWidgetSignal = const  ContainerSignal();
  final Widget _fixedWidgetClock = const ContainerClock();

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
  final double _fixedWidgetSignalLeft = 0;
  final double _fixedWidgetSignalRight = 0;
  final double _fixedWidgetSignalBottom = 0;

  final double _fixedWidgetClockTop = 0;
  final double _fixedWidgetClockLeft = 0;
  final double _fixedWidgetClockRight = 0;
  final double _fixedWidgetClockBottom = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/original.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bluetooth,
              color: Colors.black,
            ),
            tooltip: 'Bluetooth',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const FindDevicesScreen(),
              ));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: _fixedWidgetTop,
            left: _fixedWidgetSignalLeft,
            right: _fixedWidgetSignalRight,
            bottom: _fixedWidgetSignalBottom,
            child: _fixedWidgetSignal,
          ),
          Positioned.fill(
            child: _widgetOptions[currentIndex],
          ),
          Positioned(
            top: _fixedWidgetClockTop,
            left: _fixedWidgetClockLeft,
            right: _fixedWidgetClockRight,
            bottom: _fixedWidgetClockBottom,
            child: _fixedWidgetClock,
          ),
          
        ],
      ),

      //Botones de Navegaci��n
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
