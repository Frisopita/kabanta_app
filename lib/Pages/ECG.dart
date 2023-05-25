import 'package:flutter/material.dart';

class ECG extends StatefulWidget {
  const ECG({super.key});

  @override
  State<ECG> createState() => _ECGState();
}

class _ECGState extends State<ECG> {
  String buttonName1 = 'Click';
  String buttonName2 = 'Click';
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ECG'),
      ),
      body: Container(
        color: Colors.pink.shade100,
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade500,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        setState(() {
                          buttonName1 = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttonName1),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade500,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        setState(() {
                          buttonName2 = 'Clicked';
                        });
                        print('Bbcita');
                      },
                      child: Text(buttonName2),
                    ),
                  ],
        )
      )
      
    );
  }
}