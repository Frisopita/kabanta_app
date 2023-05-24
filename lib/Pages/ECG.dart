//ECG Page

import 'package:flutter/material.dart';

class ECG extends StatefulWidget {
  const ECG({super.key});

  @override
  State<ECG> createState() => _ECGState();
}

class _ECGState extends State<ECG> {
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
    );
  }
}