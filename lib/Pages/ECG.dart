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
  final TextStyle timeLabel = const TextStyle(
    fontSize: 25.0,
    color: Colors.black,
  );

  final TextStyle signaLabel = const TextStyle(
    fontSize: 18.0,
    color: Colors.black,
  );

  final TextStyle titleLabel = const TextStyle(
    fontSize: 18.0,
    color: Colors.black,
  );

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

  bool isClicked = false;

  Color colorbackbutt1 = Colors.indigo.shade700;
  Color colorforebutt1 = Colors.white;
  Color colorbackbutt2 = Colors.white;
  Color colorforebutt2 = Colors.indigo;

  double spaceleft = 7;
  double spacetop = 7;
  double spaceright = 7;
  double spacebott = 7;

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
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Text(
                  '00:00:00',
                  style: timeLabel,
                ),
              ),
            ),
          ),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //0
        Container(
          width: double.infinity,
          height: 50,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        5, //left
                        9, //top
                        5, //right
                        9 //botton
                        ),
                    child: Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade300,
                          borderRadius: BorderRadius.circular(2)),
                      child: Center(
                        child: Text(
                          'NS',
                          style: signaLabel,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                        width: 250,
                        height: 30,
                        child: Image.asset(
                          'Images/arryt.png',
                          fit: BoxFit.contain,
                        )),
                  ),
                ],
              ),
              Container(
                height: 1, // Altura de la l赤nea de separaci車n
                color: Colors.grey.shade300, // Color de la l赤nea de separaci車n
                margin: const EdgeInsets.symmetric(vertical: 0),
              ),
            ],
          ),
        ),

          Expanded(
            child: Column(
              children: [
                //1 Widget de botones
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Boton 1
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(2, spacetop, 35, spacebott),
                        child: Container(
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                      //Boton 2
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                      //Boton 3
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //2 First Title
            Padding(
              padding: EdgeInsets.fromLTRB(18, spacetop, spaceright, spacebott),
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'TACHYCARDIA',
                    style: titleLabel,
                  ),
                ),
              ),
            ),
            //3 First Line
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Container(
                height: 1, // Altura de la l赤nea de separaci車n
                color: Colors.grey, // Color de la l赤nea de separaci車n
                margin: const EdgeInsets.symmetric(
                    vertical: 3), // Margen vertical para ajustar la separaci車n
              ),
            ),
            //4 First Button Widget
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      //Boton 4
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                      //Boton 5
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      //Boton 6
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                      //Boton 7
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      //Boton 8
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                      //Boton 9
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                    ],
                  ),
                ],
              )),
            ),
            //5 Second Title
            Padding(
              padding: EdgeInsets.fromLTRB(18, spacetop, spaceright, spacebott),
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'BRADYCARDIA',
                    style: titleLabel,
                  ),
                ),
              ),
            ),
            //6 Second Line
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Container(
                height: 1, // Altura de la l赤nea de separaci車n
                color: Colors.grey, // Color de la l赤nea de separaci車n
                margin: const EdgeInsets.symmetric(
                    vertical: 3), // Margen vertical para ajustar la separaci車n
              ),
            ),

            //7 Second Buttons Widget
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      //Boton 10
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                      //Boton 11
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                      //Boton 12
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      //Boton 13
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                      //Boton 14
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                      //Boton 15
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      //Boton 16
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                      //Boton 17
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                      //Boton 18
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
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
                      ),
                    ],
                  ),
                ],
              )),
            ),

          ],
          ),
          ),

            
          Container(
          height: 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 1, // Altura de la l赤nea de separaci車n
                color: Colors.grey.shade300, // Color de la l赤nea de separaci車n
                margin: const EdgeInsets.symmetric(vertical: 0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.pause),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.stop),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {},
                      child: const Text('Upload'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorbackbutt2,
                          foregroundColor: colorforebutt2),
                      onPressed: () {},
                      child: const Text('Progam'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
          ],
        ),
      ),
    );
  }
}
