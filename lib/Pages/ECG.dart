import 'package:flutter/material.dart';

double ecgbutwid = 120;
double ecgbuthei = 66;

class ECG extends StatefulWidget {
  const ECG({super.key});

  @override
  State<ECG> createState() => _ECGState();
}

class _ECGState extends State<ECG> {
  String buttonName1 = 'Click';
  String buttonName2 = 'Click';
  double ecgbutwid = 120;
  double ecgbuthei = 66;
  bool isClicked = false;
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
        body: Container(
            color: Colors.pink.shade100,
            width: double.infinity,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                                foregroundColor: Colors.white),
                            onPressed: () {
                              setState(() {
                                buttonName1 = 'Clicked';
                              });
                              print('Holiwis');
                            },
                            child: Text(buttonName1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
