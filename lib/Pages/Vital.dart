//Vital Signs Page
import 'package:flutter/material.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:provider/provider.dart';
import 'package:kabanta_app1/Providers/sliders.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //0
             Container(
                height: 50,
                color: null,
              ),
            //1
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Heart Rate
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('Icons/corazon.png',
                                width: 18,
                                height: 18,),
                                /*const Icon(
                                  Icons.favorite_border,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),*/
                                const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    'Heart Rate',
                                    style: vitaltextLabel,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: SliderTheme(
                                  data: const SliderThemeData(
                                    trackHeight: 5,
                                  ),
                                  child: Slider(
                                    value: Provider.of<BleWriteSliderProvider>(
                                            context)
                                        .currentSliderValue1,
                                    min: heartmin,
                                    max: heartmax,
                                    divisions: null,
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
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 118, 0),
                                    child: Text('${heartmin.toInt()}'),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(118, 0, 5, 0),
                                    child: Text('${heartmax.toInt()}'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              '${status1}',
                              style: vitanumLabel,
                            ),
                          ),
                        ),
                      ],
                    ),
      
                    //Temperature
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('Icons/temperatura.png',
                                width: 18,
                                height: 18,),
                                /*Icon(
                                  Icons.thermostat,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),*/
                                const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    'Temperature',
                                    style: vitaltextLabel,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: SizedBox(
                                height: slideheight,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Slider(
                                  value:
                                      Provider.of<BleWriteSliderProvider>(context)
                                          .currentSliderValue2,
                                  min: tempmin,
                                  max: tempmax,
                                  divisions: null,
                                  label:
                                      Provider.of<BleWriteSliderProvider>(context)
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 118, 0),
                                    child: Text('${tempmin.toInt()}'),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(120, 0, 5, 0),
                                    child: Text('${tempmax.toInt()}'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              '${status2}',
                              style: vitanumLabel,
                            ),
                          ),
                        ),
                      ],
                    ),
      
                    //SpO2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('Icons/o2.png',
                                width: 18,
                                height: 18,),
                                /*Icon(
                                  Icons.bloodtype,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),*/
                                const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    'SpO2',
                                    style: vitaltextLabel,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: SizedBox(
                                height: slideheight,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Slider(
                                  value:
                                      Provider.of<BleWriteSliderProvider>(context)
                                          .currentSliderValue3,
                                  min: spo2min,
                                  max: spo2max,
                                  divisions: null,
                                  label:
                                      Provider.of<BleWriteSliderProvider>(context)
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 118, 0),
                                    child: Text('${spo2min.toInt()}'),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(118, 0, 5, 0),
                                    child: Text('${spo2max.toInt()}'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              '${status3}',
                              style: vitanumLabel,
                            ),
                          ),
                        ),
                      ],
                    ),
      
                    //Systolic Preassure
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('Icons/pressure.png',
                                width: 18,
                                height: 18,),
                                /*Icon(
                                  Icons.loyalty,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),*/
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Systolic Pressure',
                                    style: vitaltextLabel,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: SizedBox(
                                height: slideheight,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Slider(
                                  value:
                                      Provider.of<BleWriteSliderProvider>(context)
                                          .currentSliderValue4,
                                  min: sysmin,
                                  max: sysmax,
                                  divisions: null,
                                  label:
                                      Provider.of<BleWriteSliderProvider>(context)
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 118, 0),
                                    child: Text('${sysmin.toInt()}'),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(118, 0, 5, 0),
                                    child: Text('${sysmax.toInt()}'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              '${status4}',
                              style: vitanumLabel,
                            ),
                          ),
                        ),
                      ],
                    ),
      
                    //Diastolic Preassure
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('Icons/pressure.png',
                                width: 18,
                                height: 18,),
                                /*Icon(
                                  Icons.volunteer_activism,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),*/
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Diastolic Pressure',
                                    style: vitaltextLabel,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: SizedBox(
                                height: slideheight,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Slider(
                                  value:
                                      Provider.of<BleWriteSliderProvider>(context)
                                          .currentSliderValue5,
                                  min: diamin,
                                  max: diamax,
                                  divisions: null,
                                  label:
                                      Provider.of<BleWriteSliderProvider>(context)
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 118, 0),
                                    child: Text('${diamin.toInt()}'),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(118, 0, 5, 0),
                                    child: Text('${diamax.toInt()}'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              '${status5}',
                              style: vitanumLabel,
                            ),
                          ),
                        ),
                      ],
                    ),
      
                    //FR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('Icons/pulso.png',
                                width: 18,
                                height: 18,),
                                /*Icon(
                                  Icons.star_border,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),*/
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Frequency Rate',
                                    style: vitaltextLabel,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: SizedBox(
                                height: slideheight,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Slider(
                                  value:
                                      Provider.of<BleWriteSliderProvider>(context)
                                          .currentSliderValue6,
                                  min: frmin,
                                  max: frmax,
                                  divisions: null,
                                  label:
                                      Provider.of<BleWriteSliderProvider>(context)
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 125, 0),
                                    child: Text('${frmin.toInt()}'),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(125, 0, 5, 0),
                                    child: Text('${frmax.toInt()}'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              '${status6}',
                              style: vitanumLabel,
                            ),
                          ),
                        ),
                      ],
                    ),
      
                    //CO2 Level
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('Icons/co2.png',
                                width: 20,
                                height: 20,),
                                /*Icon(
                                  Icons.co2,
                                  size: 18,
                                  color: Colors.blueGrey,
                                ),*/
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'CO2 Level',
                                    style: vitaltextLabel,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: SizedBox(
                                height: slideheight,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Slider(
                                  value:
                                      Provider.of<BleWriteSliderProvider>(context)
                                          .currentSliderValue7,
                                  min: co2min,
                                  max: co2max,
                                  divisions: null,
                                  label:
                                      Provider.of<BleWriteSliderProvider>(context)
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
                            ),
                            
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 125, 0),
                                    child: Text('${co2min.toInt()}'),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(125, 0, 5, 0),
                                    child: Text('${co2max.toInt()}'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              '${status7}',
                              style: vitanumLabel,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //2
            Container(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
