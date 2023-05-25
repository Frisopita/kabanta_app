//Vital Signs Page

import 'package:flutter/material.dart';

class Vital extends StatefulWidget {
  const Vital({super.key});

  @override
  State<Vital> createState() => _VitalState();
}

class _VitalState extends State<Vital> {
  double _currentSliderValue1 = 0;
  double _currentSliderValue2 = 0;
  double _currentSliderValue3 = 0;
  double _currentSliderValue4 = 0;
  double _currentSliderValue5 = 0;
  double _currentSliderValue6 = 0;
  double _currentSliderValue7 = 0;
  String _status = 'idle';
  Color _statusColor = Colors.amber;
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
          ]),
      body: Column(
        children: <Widget>[
          //Heart Rate
          SizedBox(
            width: 200,
            height: 75,
            child: Slider(
              value: _currentSliderValue1,
              max: 100,
              divisions: 5,
              label: _currentSliderValue1.round().toString(),
              activeColor: Colors.blueGrey,
              inactiveColor: Colors.blueGrey.shade200,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue1 = value;
                });
              },
            ),
          ),

          //Temperature
          SizedBox(
            width: 200,
            height: 75,
            child: Slider(
              value: _currentSliderValue2,
              max: 100,
              divisions: 5,
              label: _currentSliderValue2.round().toString(),
              activeColor: Colors.blueGrey,
              inactiveColor: Colors.blueGrey.shade200,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue2 = value;
                });
              },
            ),
          ),

          //SpO2
          SizedBox(
            width: 200,
            height: 75,
            child: Slider(
              value: _currentSliderValue3,
              max: 100,
              divisions: 5,
              label: _currentSliderValue3.round().toString(),
              activeColor: Colors.blueGrey,
              inactiveColor: Colors.blueGrey.shade200,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue3 = value;
                });
              },
            ),
          ),

          //Systolic Preassure
          SizedBox(
            width: 200,
            height: 75,
            child: Slider(
              value: _currentSliderValue4,
              max: 100,
              divisions: 5,
              label: _currentSliderValue4.round().toString(),
              activeColor: Colors.blueGrey,
              inactiveColor: Colors.blueGrey.shade200,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue4 = value;
                });
              },
            ),
          ),

          //Diastolic Preassure
          SizedBox(
              width: 200,
              height: 100,
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Slider(
                    min: 0.0,
                    max: 100.0,
                    value: _currentSliderValue5,
                    divisions: 10,
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue5 = value;
                        _status = 'active (${_currentSliderValue5.round()})';
                        _statusColor = Colors.green;
                      });
                    },
                    onChangeStart: (value) {
                      setState(() {
                        _status = 'start';
                        _statusColor = Colors.lightGreen;
                      });
                    },
                    onChangeEnd: (value) {
                      setState(() {
                        _status = 'end';
                        _statusColor = Colors.red;
                      });
                    },
                  ),
                  ),                  
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                    'Status: $_status',
                    style: TextStyle(color: _statusColor, fontSize: 10),
                  ),
                  ),
                  
                ],
              )),

          //FR
          SizedBox(
            width: 200,
            height: 75,
            child: Slider(
              value: _currentSliderValue6,
              max: 100,
              divisions: 5,
              label: _currentSliderValue6.round().toString(),
              activeColor: Colors.blueGrey,
              inactiveColor: Colors.blueGrey.shade200,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue6 = value;
                });
              },
            ),
          ),

          //CO2 Level
          
        ],
      ),
    );
  }
}
