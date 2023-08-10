//Test de kabanta UX
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/gen/flutterblueplus.pb.dart';
import 'package:kabanta_app1/pages/ECG.dart';
import 'package:kabanta_app1/pages/Scenery.dart';
import 'package:kabanta_app1/pages/history.dart';
import 'package:kabanta_app1/pages/vital.dart';
import 'package:kabanta_app1/Providers/ble_provider.dart';
import 'package:kabanta_app1/bluetooth/qrble.dart';
import 'package:kabanta_app1/bluetooth/bluetooth.dart';
import 'package:kabanta_app1/widgets/containers.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:provider/provider.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as flutter_blue;
import 'package:permission_handler/permission_handler.dart';
import 'package:kabanta_app1/Providers/device_provider.dart';
import 'package:kabanta_app1/Providers/blewrite_sliderprovider.dart';
import 'Providers/qrtext_provider.dart';

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
      runApp(MyKabantaApp());
    });
  } else {
    runApp(MyKabantaApp());
  }
}

class MyKabantaApp extends StatelessWidget {
  MyKabantaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
        StreamProvider<flutter_blue.BluetoothState>.value(
          value: flutter_blue.FlutterBluePlus.instance.state,
          initialData: flutter_blue.BluetoothState.unknown,
        ),
        ChangeNotifierProvider<DeviceProvider>(
          create: (BuildContext context) => DeviceProvider(),
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
            final blState = context.watch<flutter_blue.BluetoothState>();

            if (blState == flutter_blue.BluetoothState.on) {
              return const QrboardPage();
            } else {
              return const BluetoothScreenOffOn();
            }

            // Si el estado de Bluetooth no esta encendido, muestra la pantalla BluetoothOffScreen con el estado actual
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
  double _fixedWidgetTop = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox appBarBox = context.findRenderObject() as RenderBox;
      setState(() {
        _fixedWidgetTop = appBarBox.size.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceProvider = Provider.of<DeviceProvider>(context);
    final device = deviceProvider.device;
    final List<Widget> _widgetOptions = <Widget>[
      ECG(device: device),
      const Vital(),
      const Scenery(),
      const History(),
    ];
    final Widget _fixedWidgetSignal = ContainerSignal();

    final Widget _fixedWidgetClock = ContainerClock(device: device);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/original.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          StreamBuilder<flutter_blue.BluetoothDeviceState>(
            stream: device.state,
            builder: (context, snapshot) {
              if (snapshot.data ==
                  flutter_blue.BluetoothDeviceState.connected) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.shade200,
                        borderRadius: BorderRadius.circular(3)
                      ),
                      height: 35,
                      width: 70,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Device',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('connected',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )
                    ),
                  ),
                );
              } else {
                return IconButton(
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const QrboardPage(),
                    ));
                  },
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
            children: _widgetOptions,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: null,
            child: _fixedWidgetSignal,
          ),
          Positioned(
            top: null,
            left: 0,
            right: 0,
            bottom: 0,
            child: _fixedWidgetClock,
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
    );
  }
}
