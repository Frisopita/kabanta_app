import 'package:flutter/material.dart';
import 'package:kabanta_app1/variables.dart';

class ECG extends StatefulWidget {
  const ECG({super.key});

  @override
  State<ECG> createState() => _ECGState();
}

class _ECGState extends State<ECG> {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Container(
              height: 50,
            ),
            //1
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //1 Widget de botones
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //Boton 1
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    2, spacetop, 35, spacebott),
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
                                    child: Text(buttECG1),
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
                                    child: Text(buttECG2),
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
                                    child: Text(buttECG3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ),
                    //2 First Title
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          18, spacetop, spaceright, spacebott),
                      child:const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'TACHYCARDIA',
                            style: titleLabel,
                          ),
                        ),     
                    ),
                    //3 First Line
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Container(
                        height: 1, // Altura de la l赤nea de separaci車n
                        color: Colors.grey, // Color de la l赤nea de separaci車n
                      ),
                    ),
                    //4 First Button Widget
                    Padding(
                      padding: const EdgeInsets.all(5),
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
                                    child: Text(buttECG4),
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
                                    child: Text(buttECG5),
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
                                    child: Text(buttECG6),
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
                                    child: Text(buttECG7),
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
                                    child: Text(buttECG8),
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
                                    child: Text(buttECG9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //5 Second Title
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          18, spacetop, spaceright, spacebott),
                      child:  const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'BRADYCARDIA',
                            style: titleLabel,
                          ),
                      ),
                    ),
                    //6 Second Line
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Container(
                        height: 1, // Altura de la l赤nea de separaci車n
                        color: Colors.grey, // Color de la l赤nea de separaci車n
                      ),
                    ),
              
                    //7 Second Buttons Widget
                    Padding(
                      padding: const EdgeInsets.all(10),
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
                                    child: Text(buttECG10),
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
                                    child: Text(buttECG11),
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
                                    child: Text(buttECG12),
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
                                    child: Text(buttECG13),
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
                                    child: Text(buttECG14),
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
                                    child: Text(buttECG15),
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
                                    child: Text(buttECG16),
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
                                    child: Text(buttECG17),
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
                                    child: Text(buttECG18),
                                  ),
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
