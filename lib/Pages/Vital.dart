//Vital Signs Page

import 'package:flutter/material.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:kabanta_app1/containers.dart';

Color colorbackbutt2 = Colors.white;
Color colorforebutt2 = Colors.indigo;

class Vital extends StatefulWidget {
  const Vital({super.key});

  @override
  State<Vital> createState() => _VitalState();
}

class _VitalState extends State<Vital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //0
          const ContainerSignal(),
          //1
          Expanded(
            child: SingleChildScrollView(
              child: LayoutBuilder(
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
                                  'Heart Rate: $status1',
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
                                    value: currentSliderValue1,
                                    min: heartmin,
                                    max: heartmax,
                                    divisions: heartdiv,
                                    label:
                                        currentSliderValue1.round().toString(),
                                    activeColor: Colors.blueGrey,
                                    inactiveColor: Colors.blueGrey.shade200,
                                    onChanged: (double value) {
                                      setState(() {
                                        currentSliderValue1 = value;
                                        status1 =
                                            '${currentSliderValue1.round()}';
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
                                  'Temperature: $status2',
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
                                  value: currentSliderValue2,
                                  min: tempmin,
                                  max: tempmax,
                                  divisions: tempdiv,
                                  label: currentSliderValue2.round().toString(),
                                  activeColor: Colors.blueGrey,
                                  inactiveColor: Colors.blueGrey.shade200,
                                  onChanged: (double value) {
                                    setState(() {
                                      currentSliderValue2 = value;
                                      status2 =
                                          '${currentSliderValue2.round()}';
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
                                  'SpO2: $status3',
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
                                  value: currentSliderValue3,
                                  min: spo2min,
                                  max: spo2max,
                                  divisions: spo2div,
                                  label: currentSliderValue3.round().toString(),
                                  activeColor: Colors.blueGrey,
                                  inactiveColor: Colors.blueGrey.shade200,
                                  onChanged: (double value) {
                                    setState(() {
                                      currentSliderValue3 = value;
                                      status3 =
                                          '${currentSliderValue3.round()}';
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
                                  'Systolic Preassure: $status4',
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
                                  value: currentSliderValue4,
                                  min: sysmin,
                                  max: sysmax,
                                  divisions: sysdiv,
                                  label: currentSliderValue4.round().toString(),
                                  activeColor: Colors.blueGrey,
                                  inactiveColor: Colors.blueGrey.shade200,
                                  onChanged: (double value) {
                                    setState(() {
                                      currentSliderValue4 = value;
                                      status4 =
                                          '${currentSliderValue4.round()}';
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
                                  'Diastolic Preassure: $status5',
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
                                  value: currentSliderValue5,
                                  min: diamin,
                                  max: diamax,
                                  divisions: diadiv,
                                  label: currentSliderValue5.round().toString(),
                                  activeColor: Colors.blueGrey,
                                  inactiveColor: Colors.blueGrey.shade200,
                                  onChanged: (double value) {
                                    setState(() {
                                      currentSliderValue5 = value;
                                      status5 =
                                          '${currentSliderValue5.round()}';
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
                                  'Frequency Rate: $status6',
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
                                  value: currentSliderValue6,
                                  min: frmin,
                                  max: frmax,
                                  divisions: frdiv,
                                  label: currentSliderValue6.round().toString(),
                                  activeColor: Colors.blueGrey,
                                  inactiveColor: Colors.blueGrey.shade200,
                                  onChanged: (double value) {
                                    setState(() {
                                      currentSliderValue6 = value;
                                      status6 =
                                          '${currentSliderValue6.round()}';
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
                                  'CO2 Level: $status7',
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
                                  value: currentSliderValue7,
                                  min: co2min,
                                  max: co2max,
                                  divisions: co2div,
                                  label: currentSliderValue7.round().toString(),
                                  activeColor: Colors.blueGrey,
                                  inactiveColor: Colors.blueGrey.shade200,
                                  onChanged: (double value) {
                                    setState(() {
                                      currentSliderValue7 = value;
                                      status7 =
                                          '${currentSliderValue7.round()}';
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
              }),
            ),
          ),
          //2
          Container(
            height: 80,
          ),
        ],
      ),
    );
  }
}
