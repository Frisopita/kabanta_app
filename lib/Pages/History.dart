import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset('Images/original.png',
              fit: BoxFit.cover,
              height: 100,
              width:
                  130), //const Text('Kabsim App', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              tooltip: 'Settings',
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Settings')));
              },
            ),
          ],
        ),
    );
  }
}