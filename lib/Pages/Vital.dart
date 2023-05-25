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
  String _status1 = '0';
  String _status2 = '0';
  String _status3 = '0';
  String _status4 = '0';
  String _status5 = '0';
  String _status6 = '0';
  String _status7 = '0';
  double slidewidht = 300;
  double slideheight = 45;
  double textwidht = 300;
  double textheight = 25;

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
            width: textwidht,
            height: textheight,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '  Heart Rate: $_status1',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: slidewidht,
              height: slideheight,
              child: Row(
                children: [
                  Slider(
                    value: _currentSliderValue1,
                    max: 100,
                    divisions: 5,
                    label: _currentSliderValue1.round().toString(),
                    activeColor: Colors.blueGrey,
                    inactiveColor: Colors.blueGrey.shade200,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue1 = value;
                        _status1 = '${_currentSliderValue1.round()}';
                      });
                    },
                  ),
                ],
              )),

          //Temperature
          SizedBox(
            width: textwidht,
            height: textheight,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '  Temperature: $_status2',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: slidewidht,
              height: slideheight,
              child: Row(
                children: [
                  Slider(
                    value: _currentSliderValue2,
                    max: 100,
                    divisions: 5,
                    label: _currentSliderValue2.round().toString(),
                    activeColor: Colors.blueGrey,
                    inactiveColor: Colors.blueGrey.shade200,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue2 = value;
                        _status2 = '${_currentSliderValue2.round()}';
                      });
                    },
                  ),
                ],
              )),
          //SpO2
          SizedBox(
            width: textwidht,
            height: textheight,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '  SpO2: $_status3',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: slidewidht,
              height: slideheight,
              child: Row(
                children: [
                  Slider(
                    value: _currentSliderValue3,
                    max: 100,
                    divisions: 5,
                    label: _currentSliderValue3.round().toString(),
                    activeColor: Colors.blueGrey,
                    inactiveColor: Colors.blueGrey.shade200,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue3 = value;
                        _status3 = '${_currentSliderValue3.round()}';
                      });
                    },
                  ),
                ],
              )),
          //Systolic Preassure
          SizedBox(
            width: textwidht,
            height: textheight,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '  Systolic Preassure: $_status4',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: slidewidht,
              height: slideheight,
              child: Row(
                children: [
                  Slider(
                    value: _currentSliderValue4,
                    max: 100,
                    divisions: 5,
                    label: _currentSliderValue4.round().toString(),
                    activeColor: Colors.blueGrey,
                    inactiveColor: Colors.blueGrey.shade200,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue4 = value;
                        _status4 = '${_currentSliderValue4.round()}';
                      });
                    },
                  ),
                ],
              ),
              ),
          //Diastolic Preassure
          SizedBox(
            width: textwidht,
            height: textheight,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '  Diastolic Preassure: $_status5',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: slidewidht,
              height: slideheight,
              child: Row(
                children: [
                  Slider(
                    value: _currentSliderValue5,
                    max: 100,
                    divisions: 5,
                    label: _currentSliderValue5.round().toString(),
                    activeColor: Colors.blueGrey,
                    inactiveColor: Colors.blueGrey.shade200,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue5 = value;
                        _status5 = '${_currentSliderValue5.round()}';
                      });
                    },
                  ),
                ],
              )),

          //FR
          SizedBox(
            width: textwidht,
            height: textheight,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '  Frequency Rate: $_status6',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: slidewidht,
              height: slideheight,
              child: Row(
                children: [
                  Slider(
                    value: _currentSliderValue6,
                    max: 100,
                    divisions: 5,
                    label: _currentSliderValue6.round().toString(),
                    activeColor: Colors.blueGrey,
                    inactiveColor: Colors.blueGrey.shade200,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue6 = value;
                        _status6 = '${_currentSliderValue6.round()}';
                      });
                    },
                  ),
                ],
              )),
          //CO2 Level
          SizedBox(
            width: textwidht,
            height: textheight,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '  CO2 Level: $_status7',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: slidewidht,
              height: slideheight,
              child: Row(
                children: [
                  Slider(
                    value: _currentSliderValue7,
                    max: 100,
                    divisions: 5,
                    label: _currentSliderValue7.round().toString(),
                    activeColor: Colors.blueGrey,
                    inactiveColor: Colors.blueGrey.shade200,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue7 = value;
                        _status7 = '${_currentSliderValue7.round()}';
                      });
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
