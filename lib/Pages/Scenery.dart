import 'package:flutter/material.dart';

class Scenery extends StatefulWidget {
  const Scenery({super.key});

  @override
  State<Scenery> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/original.png', fit: BoxFit.cover, height:100,width:130),//const Text('Kabsim App', style: TextStyle(color: Colors.black),),
        backgroundColor: const Color.fromARGB(255, 84, 57, 141),
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
    );
  }
}