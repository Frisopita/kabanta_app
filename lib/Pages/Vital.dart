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
                                    value: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue1,
                                    min: heartmin,
                                    max: heartmax,
                                    divisions: heartdiv,
                                    label: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue1
                                        .round()
                                        .toString(),
                                    activeColor: Colors.blueGrey,
                                    inactiveColor: Colors.blueGrey.shade200,
                                    onChanged: (double value) {
                                      setState(() {
                                        Provider.of<BleWriteSliderProvider>(
                                                context,
                                                listen: false)
                                            .updateSliderValue1(value);
                                        status1 = '${value.round()}';
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
                                  value: Provider.of<BleWriteSliderProvider>(
                                          context)
                                      .currentSliderValue2,
                                  min: tempmin,
                                  max: tempmax,
                                  divisions: tempdiv,
                                  label: Provider.of<BleWriteSliderProvider>(
                                          context)
                                      .currentSliderValue2
                                      .round()
                                      .toString(),
                                  activeColor: Colors.blueGrey,
                                  inactiveColor: Colors.blueGrey.shade200,
                                  onChanged: (double value) {
                                    setState(() {
                                      Provider.of<BleWriteSliderProvider>(
                                              context,
                                              listen: false)
                                          .updateSliderValue2(value);
                                      status2 = '${value.round()}';
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
                                    value: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue3,
                                    min: spo2min,
                                    max: spo2max,
                                    divisions: spo2div,
                                    label: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue3
                                        .round()
                                        .toString(),
                                    activeColor: Colors.blueGrey,
                                    inactiveColor: Colors.blueGrey.shade200,
                                    onChanged: (double value) {
                                      setState(() {
                                        Provider.of<BleWriteSliderProvider>(
                                                context,
                                                listen: false)
                                            .updateSliderValue3(value);
                                        status3 = '${value.round()}';
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
                                    value: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue4,
                                    min: sysmin,
                                    max: sysmax,
                                    divisions: sysdiv,
                                    label: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue4
                                        .round()
                                        .toString(),
                                    activeColor: Colors.blueGrey,
                                    inactiveColor: Colors.blueGrey.shade200,
                                    onChanged: (double value) {
                                      setState(() {
                                        Provider.of<BleWriteSliderProvider>(
                                                context,
                                                listen: false)
                                            .updateSliderValue4(value);
                                        status4 = '${value.round()}';
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
                                    value: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue5,
                                    min: diamin,
                                    max: diamax,
                                    divisions: diadiv,
                                    label: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue5
                                        .round()
                                        .toString(),
                                    activeColor: Colors.blueGrey,
                                    inactiveColor: Colors.blueGrey.shade200,
                                    onChanged: (double value) {
                                      setState(() {
                                        Provider.of<BleWriteSliderProvider>(
                                                context,
                                                listen: false)
                                            .updateSliderValue5(value);
                                        status5 = '${value.round()}';
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
                                    value: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue6,
                                    min: frmin,
                                    max: frmax,
                                    divisions: frdiv,
                                    label: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue6
                                        .round()
                                        .toString(),
                                    activeColor: Colors.blueGrey,
                                    inactiveColor: Colors.blueGrey.shade200,
                                    onChanged: (double value) {
                                      setState(() {
                                        Provider.of<BleWriteSliderProvider>(
                                                context,
                                                listen: false)
                                            .updateSliderValue6(value);
                                        status6 = '${value.round()}';
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
                                    value: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue7,
                                    min: co2min,
                                    max: co2max,
                                    divisions: co2div,
                                    label: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue7
                                        .round()
                                        .toString(),
                                    activeColor: Colors.blueGrey,
                                    inactiveColor: Colors.blueGrey.shade200,
                                    onChanged: (double value) {
                                      setState(() {
                                        Provider.of<BleWriteSliderProvider>(
                                                context,
                                                listen: false)
                                            .updateSliderValue7(value);
                                        status7 = '${value.round()}';
                                      });
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Consumer<List<BLE>>(
                        builder: (context, sensors, _) {
                          print('print $sensors');
                          loopCallback(BLE sensor) {
                            String value = sensor.data;
                            switch (sensor.id) {
                              case 'Heart Rate':
                                {
                                  heart = value;
                                }
                                break;

                              case 'Temperature':
                                {
                                  temp = value;
                                }
                                break;

                              case 'SP02':
                                {
                                  spo2 = value;
                                }
                                break;
                              case 'Systolic Preasure':
                                {
                                  sysp = value;
                                }
                                break;
                              case 'Diastolic Preasure':
                                {
                                  diasp = value;
                                }
                                break;
                              case 'Frecuency':
                                {
                                  freq = value;
                                }
                                break;
                              case 'CO2':
                                {
                                  co2 = value;
                                }
                                break;
                            }
                          }

                          sensors.forEach(loopCallback);
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('Heart Rate: $heart'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('Temperature: $temp'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('SPO2: $spo2'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('Systolic Preasuare: $sysp'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('Diastolic Preasure: $diasp'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('Frecuency: $freq'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('CO2: $co2'),
                              ),
                            ],
                          );
                        },
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
