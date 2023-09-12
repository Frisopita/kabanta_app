//Test de kabanta UX
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as flutter_blue;
import 'package:kabanta_app1/bluetooth/bluetooth.dart';
import 'package:kabanta_app1/bluetooth/qrble.dart';
import 'package:kabanta_app1/pages/ekg.dart';
import 'package:kabanta_app1/pages/history.dart';
import 'package:kabanta_app1/pages/scenery.dart';
import 'package:kabanta_app1/pages/vital.dart';
import 'package:kabanta_app1/providers/ble_provider.dart';
import 'package:kabanta_app1/providers/clock_provider.dart';
import 'package:kabanta_app1/widgets/containers.dart';
import 'package:kabanta_app1/providers/clocktime.dart';
import 'package:kabanta_app1/providers/device_provider.dart';
import 'package:kabanta_app1/providers/qrtext_provider.dart';
import 'package:kabanta_app1/providers/sliders.dart';
import 'package:kabanta_app1/providers/states.dart';
import 'package:kabanta_app1/providers/timer.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

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

class MyKabantaApp extends StatelessWidget {
  const MyKabantaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClockService>(create: (_)=>ClockService()),
        ProxyProvider0(create: (context) => Provider.of(context, listen: false).id,
        update: (context, value){
          final id = Provider.of<ClockService>(context);
          return id;
        },),
        ChangeNotifierProvider<BleProvider>(
          /// lazy se usa para incializar un provider antes de tiempo:
          /// true: se incializa desde que se inserta en el Widget Tre e
          /// false: se inicializa hasta que se utiliza por 1ra vez
          /// null: mismo que false
          lazy: null,
          //Se encarga de la notificacion de los cambios de provider
          create: (BuildContext context) => BleProvider(),
        ),

        /// Puedes iniciar el stream dentro de un provider y usarlo en toda la app.
        /// Lo ideal seria usar un wrapper y meter el stream dentro de un objeto o servicio que nosotros
        /// escribieramos

        StreamProvider<flutter_blue.BluetoothAdapterState>.value(
          value: flutter_blue.FlutterBluePlus.adapterState,
          initialData: flutter_blue.BluetoothAdapterState.unknown,
        ),
        ChangeNotifierProvider<BleStateProvider>(
          lazy: null,
          create: (BuildContext context) => BleStateProvider(0),
        ),
        ChangeNotifierProvider<BleTimesProvider>(
          create: (BuildContext context) => BleTimesProvider(0),
        ),
        ChangeNotifierProvider<DeviceProvider>(
          create: (BuildContext context) => DeviceProvider(),
        ),
        ChangeNotifierProvider<ClockTime>(
          create: (BuildContext context) => ClockTime(),
        ),
        ChangeNotifierProvider<QrTextProvider>(
          create: (BuildContext context) => QrTextProvider(),
        ),
        ChangeNotifierProvider<BleWriteSliderProvider>(
          create: (BuildContext context) => BleWriteSliderProvider(
            currentSliderValue1,
            currentSliderValue2,
            currentSliderValue3,
            currentSliderValue4,
            currentSliderValue5,
            currentSliderValue6,
            currentSliderValue7,
          ),
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
            final blState = context.watch<flutter_blue.BluetoothAdapterState>();
            //final blDvState =Provider.of<flutter_blue.BluetoothDeviceState>(context);
            if (blState == flutter_blue.BluetoothAdapterState.on) {
              // Navigate to the screen for connected device
              return const QrboardPage();
            } else {
              // Navigate to the BluetoothScreenOffOn when Bluetooth is off
              return const BluetoothScreenOffOn();
            }
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
  late PageController _pageController;

  // Variables para las posiciones del widget fijo
  double fixedWidgetTop = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox appBarBox = context.findRenderObject() as RenderBox;
      setState(() {
        fixedWidgetTop = appBarBox.size.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceProvider = Provider.of<DeviceProvider>(context);
    final device = deviceProvider.device;
    const List<Widget> widgetOptions = <Widget>[
      ECG(),
      Vital(),
      Scenery(),
      History(),
    ];

  const  Widget fixedWidgetSignal =  ContainerSignal();
    final Widget fixedWidgetClock = ContainerClock(device: device);

    return ChangeNotifierProvider<ClockService>(
      create: (_) => ClockService(),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('Images/original.png',
              fit: BoxFit.cover, height: 100, width: 130),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            StreamBuilder<flutter_blue.BluetoothConnectionState>(
              stream: device.connectionState,
              builder: (context, snapshot) {
                if (snapshot.data ==
                    flutter_blue.BluetoothConnectionState.connected) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.shade400,
                        ),
                        height: 20,
                        width: 20,
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.shade400,
                        ),
                        height: 20,
                        width: 20,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: widgetOptions,
            ),
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: null,
              child: fixedWidgetSignal,
            ),
            Positioned(
              top: null,
              left: 0,
              right: 0,
              bottom: 0,
              child: fixedWidgetClock,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 5),
              curve: Curves.easeInOut,
            );
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
      ),
    );
  }
}
