//Vital Signs Page
import 'package:flutter/material.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:kabanta_app1/containers.dart';
import 'package:kabanta_app1/Providers/ble_provider.dart';
import 'package:provider/provider.dart';
import 'package:kabanta_app1/Providers/blewrite_sliderprovider.dart';

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
                child: Column(
              children: [
                //Heart Rate
                Row(
                  children: [
                    Column(
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 18,
                              color: Colors.blueGrey,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                'Heart Rate',
                                style: vitaltextLabel,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: slidewidht,
                          child: SliderTheme(
                            data: const SliderThemeData(
                              trackHeight: 5,
                            ),
                            child: Slider(
                              value:
                                  Provider.of<BleWriteSliderProvider>(context)
                                      .currentSliderValue1,
                              min: heartmin,
                              max: heartmax,
                              divisions: null,
                              label:
                                  Provider.of<BleWriteSliderProvider>(context)
                                      .currentSliderValue1
                                      .round()
                                      .toString(),
                              activeColor: Colors.blueGrey,
                              inactiveColor: Colors.blueGrey.shade200,
                              onChanged: (double value) {
                                setState(() {
                                  Provider.of<BleWriteSliderProvider>(context,
                                          listen: false)
                                      .updateSliderValue1(value);
                                  status1 = '${value.round()}';
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
                      child: Text(
                        '${status1}',
                        style: vitanumLabel,
                      ),
                    ),
                  ],
                ),

                //Temperature
                Row(
                  children: [
                    Column(
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.thermostat,
                              size: 18,
                              color: Colors.blueGrey,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                'Temperature',
                                style: vitaltextLabel,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: slideheight,
                          width: slidewidht,
                          child: Slider(
                            value: Provider.of<BleWriteSliderProvider>(context)
                                .currentSliderValue2,
                            min: tempmin,
                            max: tempmax,
                            divisions: null,
                            label: Provider.of<BleWriteSliderProvider>(context)
                                .currentSliderValue2
                                .round()
                                .toString(),
                            activeColor: Colors.blueGrey,
                            inactiveColor: Colors.blueGrey.shade200,
                            onChanged: (double value) {
                              setState(() {
                                Provider.of<BleWriteSliderProvider>(context,
                                        listen: false)
                                    .updateSliderValue2(value);
                                status2 = '${value.round()}';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
                      child: Text(
                        '${status2}',
                        style: vitanumLabel,
                      ),
                    ),
                  ],
                ),

                //SpO2
                Row(
                  children: [
                    Column(
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.bloodtype,
                              size: 18,
                              color: Colors.blueGrey,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                'SpO2',
                                style: vitaltextLabel,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: slideheight,
                          width: slidewidht,
                          child: Slider(
                            value: Provider.of<BleWriteSliderProvider>(context)
                                .currentSliderValue3,
                            min: spo2min,
                            max: spo2max,
                            divisions: null,
                            label: Provider.of<BleWriteSliderProvider>(context)
                                .currentSliderValue3
                                .round()
                                .toString(),
                            activeColor: Colors.blueGrey,
                            inactiveColor: Colors.blueGrey.shade200,
                            onChanged: (double value) {
                              setState(() {
                                Provider.of<BleWriteSliderProvider>(context,
                                        listen: false)
                                    .updateSliderValue3(value);
                                status3 = '${value.round()}';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
                      child: Text(
                        '${status3}',
                        style: vitanumLabel,
                      ),
                    ),
                  ],
                ),

                //Systolic Preassure
                Row(
                  children: [
                    Column(
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.bloodtype,
                              size: 18,
                              color: Colors.blueGrey,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Systolic Preassure',
                                style: vitaltextLabel,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: slideheight,
                          width: slidewidht,
                          child: Slider(
                            value: Provider.of<BleWriteSliderProvider>(context)
                                .currentSliderValue4,
                            min: sysmin,
                            max: sysmax,
                            divisions: null,
                            label: Provider.of<BleWriteSliderProvider>(context)
                                .currentSliderValue4
                                .round()
                                .toString(),
                            activeColor: Colors.blueGrey,
                            inactiveColor: Colors.blueGrey.shade200,
                            onChanged: (double value) {
                              setState(() {
                                Provider.of<BleWriteSliderProvider>(context,
                                        listen: false)
                                    .updateSliderValue4(value);
                                status4 = '${value.round()}';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
                      child: Text(
                        '${status4}',
                        style: vitanumLabel,
                      ),
                    ),
                  ],
                ),
                //Diastolic Preassure
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Diastolic Preassure',
                    style: vitaltextLabel,
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: slideheight,
                          width: slidewidht,
                          child: Slider(
                            value: Provider.of<BleWriteSliderProvider>(context)
                                .currentSliderValue5,
                            min: diamin,
                            max: diamax,
                            divisions: null,
                            label: Provider.of<BleWriteSliderProvider>(context)
                                .currentSliderValue5
                                .round()
                                .toString(),
                            activeColor: Colors.blueGrey,
                            inactiveColor: Colors.blueGrey.shade200,
                            onChanged: (double value) {
                              setState(() {
                                Provider.of<BleWriteSliderProvider>(context,
                                        listen: false)
                                    .updateSliderValue5(value);
                                status5 = '${value.round()}';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
                      child: Text(
                        '${status5}',
                        style: vitanumLabel,
                      ),
                    ),
                  ],
                ),

                //FR
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Frequency Rate',
                    style: vitaltextLabel,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: slideheight,
                      width: slidewidht,
                      child: Slider(
                        value: Provider.of<BleWriteSliderProvider>(context)
                            .currentSliderValue6,
                        min: frmin,
                        max: frmax,
                        divisions: null,
                        label: Provider.of<BleWriteSliderProvider>(context)
                            .currentSliderValue6
                            .round()
                            .toString(),
                        activeColor: Colors.blueGrey,
                        inactiveColor: Colors.blueGrey.shade200,
                        onChanged: (double value) {
                          setState(() {
                            Provider.of<BleWriteSliderProvider>(context,
                                    listen: false)
                                .updateSliderValue6(value);
                            status6 = '${value.round()}';
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
                      child: Text(
                        '${status6}',
                        style: vitanumLabel,
                      ),
                    ),
                  ],
                ),

                //CO2 Level
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'CO2 Level',
                    style: vitaltextLabel,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: slideheight,
                      width: slidewidht,
                      child: Slider(
                        value: Provider.of<BleWriteSliderProvider>(context)
                            .currentSliderValue7,
                        min: co2min,
                        max: co2max,
                        divisions: null,
                        label: Provider.of<BleWriteSliderProvider>(context)
                            .currentSliderValue7
                            .round()
                            .toString(),
                        activeColor: Colors.blueGrey,
                        inactiveColor: Colors.blueGrey.shade200,
                        onChanged: (double value) {
                          setState(() {
                            Provider.of<BleWriteSliderProvider>(context,
                                    listen: false)
                                .updateSliderValue7(value);
                            status7 = '${value.round()}';
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
                      child: Text(
                        '${status7}',
                        style: vitanumLabel,
                      ),
                    ),
                  ],
                ),
              ],
            )),
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
