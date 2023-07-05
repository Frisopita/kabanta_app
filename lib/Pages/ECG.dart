import 'package:flutter/material.dart';
import 'package:kabanta_app1/bluetooth.dart';

double ecgbutwid = 120;
double ecgbuthei = 66;

class ECG extends StatefulWidget {
  const ECG({super.key});

  @override
  State<ECG> createState() => _ECGState();
}

class _ECGState extends State<ECG> {
  String buttName1 = 'NS';
  String buttName2 = 'BS';
  String buttName3 = 'TS';
  String buttName4 = 'FA';
  String buttName5 = 'Flutter';
  String buttName6 = 'TS';
  String buttName7 = 'TSV';
  String buttName8 = 'TVD';
  String buttName9 = 'TVM';
  String buttName10 = 'BS';
  String buttName11 = 'BAVI';
  String buttName12 = 'BAVII';
  String buttName13 = 'BAVIII';
  String buttName14 = 'B';
  String buttName15 = 'B';
  String buttName16 = 'B';
  String buttName17 = 'B';
  String buttName18 = 'B';
  String buttConstName = 'Cliked';

  double ecgbutwid = 120;
  double ecgbuthei = 66;
  bool isClicked = false;
  
  Color colorbackbutt1 = Colors.indigo.shade700;
  Color colorforebutt1 = Colors.white;
  Color colorbackbutt2 = Colors.white;
  Color colorforebutt2 = Colors.indigo;

  double spaceleft = 5;
  double spacetop = 5;
  double spaceright = 5;
  double spacebott = 2;


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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const FindDevicesScreen(),
              ));
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //1
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        spaceleft, 
                        spacetop, 
                        spaceright, 
                        spacebott),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt1,
                            foregroundColor: colorforebutt1),
                        onPressed: () {
                          setState(() {
                            buttConstName = 'Clicked';
                          });
                          print('Holiwis');
                        },
                        child: Text(buttName1),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        spaceleft, 
                        spacetop, 
                        spaceright, 
                        spacebott),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt1,
                            foregroundColor: colorforebutt1),
                        onPressed: () {
                          setState(() {
                            buttConstName = 'Clicked';
                          });
                          print('Holiwis');
                        },
                        child: Text(buttName2),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        spaceleft, 
                        spacetop, 
                        spaceright, 
                        spacebott),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt1,
                            foregroundColor: colorforebutt1),
                        onPressed: () {
                          setState(() {
                            buttConstName = 'Clicked';
                          });
                          print('Holiwis');
                        },
                        child: Text(buttName3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //2
            const SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                   15,
                   0,
                   0,
                   0),
                  child:  Text('TACHYCARDIA'),
                  )
              )
            ),            
            //3
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName4),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName5),
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName6),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName7),
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName8),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName9),
                    ),
                    ),
                  ],
                ),
              ],
            )),
            //4
             const SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                   15,
                   0,
                   0,
                   0),
                  child:  Text('BRADYCARDIA'),
                  )
              )
            ), 
            
            //5
            Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName10),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName11),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName12),
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName13),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName14),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName15),
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName16),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName17),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      spaceleft, 
                      spacetop, 
                      spaceright, 
                      spacebott),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {
                        setState(() {
                          buttConstName = 'Clicked';
                        });
                        print('Holiwis');
                      },
                      child: Text(buttName18),
                    ),
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
