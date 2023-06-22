//Vital Signs Page

import 'package:flutter/material.dart';


double _currentSliderValue1 = 30;
double _currentSliderValue2 = 35;
double _currentSliderValue3 = 70;
double _currentSliderValue4 = 60;
double _currentSliderValue5 = 35;
double _currentSliderValue6 = 8;
double _currentSliderValue7 = 6;

String _status1 = '30';
String _status2 = '35';
String _status3 = '70';
String _status4 = '60';
String _status5 = '35';
String _status6 = '8';
String _status7 = '6';

double slidewidht = 200;
double slideheight = 36;
double textwidht = 200;
double textheight = 30;
double buttonwidht = 120;
double buttonheight = 66;

double heartmax = 250;
double heartmin = 30;
int heartdiv = 10;

double tempmax = 40;
double tempmin = 35;
int tempdiv = 10;

double spo2max = 100;
double spo2min = 70;
int spo2div = 10;

double sysmax = 200;
double sysmin = 60;
int sysdiv = 10;

double diamax = 120;
double diamin = 35;
int diadiv = 10;

double frmax = 32;
double frmin = 8;
int frdiv = 10;

double co2max = 50;
double co2min = 6;
int co2div = 10;

String buttonName1 = 'Time';
String buttonName2 = 'Time';
String buttonName3 = 'Time';
String buttonName4 = 'Time';
String buttonName5 = 'Time';
String buttonName6 = 'Time';
String buttonName7 = 'Time';





class Vital extends StatefulWidget {
  const Vital({super.key});

  @override
  State<Vital> createState() => _VitalState();
}

class _VitalState extends State<Vital> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/original.png',
            fit: BoxFit.cover,
            height: 100,
            width: 130),
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
      body: const Center(
        child: Contentvital(),
      ),
    );
  }
}

class Contentvital extends StatefulWidget {
  const Contentvital({super.key});

  @override
  State<Contentvital> createState() => _ContentvitalState();
}

class _ContentvitalState extends State<Contentvital> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          //SizedBox as a 1st Column App
          SizedBox(
            width: constraints.maxWidth / 1.5,
            child: Column(
              children: <Widget>[
                //Heart Rate
                SizedBox(
                  width: textwidht,
                  height: textheight,
                  child: Row(
                    children: [
                      Text(
                        'Heart Rate: $_status1',
                        style: const TextStyle(fontSize: 13),
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
                          min: heartmin,
                          max: heartmax,
                          divisions: heartdiv,
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
                      Text(
                        'Temperature: $_status2',
                        style: const TextStyle(fontSize: 13),
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
                        min: tempmin,
                        max: tempmax,
                        divisions: tempdiv,
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
                  ),
                ),

                //SpO2
                SizedBox(
                  width: textwidht,
                  height: textheight,
                  child: Row(
                    children: [
                      Text(
                        'SpO2: $_status3',
                        style: const TextStyle(fontSize: 13),
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
                        min: spo2min,
                        max: spo2max,
                        divisions: spo2div,
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
                  ),
                ),

                //Systolic Preassure
                SizedBox(
                  width: textwidht,
                  height: textheight,
                  child: Row(
                    children: [
                      Text(
                        'Systolic Preassure: $_status4',
                        style: const TextStyle(fontSize: 13),
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
                        min: sysmin,
                        max: sysmax,
                        divisions: sysdiv,
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
                      Text(
                        'Diastolic Preassure: $_status5',
                        style: const TextStyle(fontSize: 13),
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
                        min: diamin,
                        max: diamax,
                        divisions: diadiv,
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
                  ),
                ),

                //FR
                SizedBox(
                  width: textwidht,
                  height: textheight,
                  child: Row(
                    children: [
                      Text(
                        'Frequency Rate: $_status6',
                        style: const TextStyle(fontSize: 13),
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
                        min: frmin,
                        max: frmax,
                        divisions: frdiv,
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
                  ),
                ),

                //CO2 Level
                SizedBox(
                  width: textwidht,
                  height: textheight,
                  child: Row(
                    children: [
                      Text(
                        'CO2 Level: $_status7',
                        style: const TextStyle(fontSize: 13),
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
                        min: co2min,
                        max: co2max,
                        divisions: co2div,
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
                  ),
                ),
              ],
            ),
          ),

        ],
      );
    });
  }
}
