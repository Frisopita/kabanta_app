//Test de kabanta UX

import 'package:flutter/material.dart';

void main() {
  runApp(const MyKabantaApp());
}

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

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

    static const TextStyle optionStyle = TextStyle(
    fontSize: 30, 
    fontWeight: 
    FontWeight.bold
    );

    static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: ECG page',
      style: optionStyle,
    ),
    Text(
      'Index 1: Vital Signs Page',
      style: optionStyle,
    ),
    Text(
      'Index 3: Scenery Page',
      style: optionStyle,
    ),
    Text(
      'Index 4: History Page',
      style: optionStyle,
    ),
  ];

  int currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/original.png', fit: BoxFit.cover, height:100,width:130),//const Text('Kabsim App', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings,
            color: Colors.black,
            ),
            tooltip: 'Settings',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings')));
            },
          ),
        ]
      ),
      body: Center(
        child: _widgetOptions.elementAt(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monitor_heart,
              color: Colors.black,
              ),
            label: 'ECG',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.accessibility_new,
              color: Colors.black,),
            label: 'Vital Signs',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tag,
              color: Colors.black,
              ),
            label: 'Scenery',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Colors.black,),
            label: 'History',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
