import 'package:flutter/material.dart';

class Scenery extends StatefulWidget {
  const Scenery({super.key});

  @override
  State<Scenery> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> {
  final TextStyle signaLabel = const TextStyle(
    fontSize: 18.0,
    color: Colors.black,
    //backgroundColor: Colors.blue.shade100
  );
  final TextStyle timeLabel = const TextStyle(
    fontSize: 25.0,
    color: Colors.black,
    //backgroundColor: Colors.blue.shade100
  );
  final TextStyle labelStyle = const TextStyle(
    fontSize: 16.0,
  );
  final TextStyle titleLabel = const TextStyle(
    fontSize: 18.0,
    color: Colors.black,
  );
  String buttName1 = 'C1';
  String buttName2 = 'C2';
  String buttName3 = 'C3';
  String buttName4 = 'C4';
  String buttName5 = 'P1';
  String buttName6 = 'P2';
  String buttName7 = 'P3';
  String buttName8 = 'P4';

  String buttConstName = 'Cliked';

  double ecgbutwid = 120;
  double ecgbuthei = 66;
  bool isClicked = false;

  Color colorbackbutt1 = Colors.indigo.shade700;
  Color colorforebutt1 = Colors.white;
  Color colorbackbutt2 = Colors.white;
  Color colorforebutt2 = Colors.indigo;

  double spaceleft = 5;
  double spacetop = 10;
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
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Settings')));
            },
          ),
        ],
      ),
      body: Column(
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
          //1 First Title
          Expanded(child: Column(
            children: [
              
          Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.fromLTRB(18, spacetop, spaceright, spacebott),
                child: SizedBox(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Predefinidos',
                      style: titleLabel,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 180,
              ),
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: () {},
              )
            ],
          ),
          //2 First Line
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Container(
              height: 1, // Altura de la l赤nea de separaci車n
              color: Colors.grey, // Color de la l赤nea de separaci車n
              margin: const EdgeInsets.symmetric(
                  vertical: 3), // Margen vertical para ajustar la separaci車n
            ),
          ),
          //3 First Button Widget
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    //Boton 1
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 80,
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
                            child: Text(buttName1),
                          ),
                        ),
                      ),
                    //Boton 2
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 80,
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
                            child: Text(buttName2),
                          ),
                        ),
                      ),
                  ],
                ),
                Column(
                  children: [
                    //Boton 3
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 80,
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
                            child: Text(buttName3),
                          ),
                        ),
                      ),
                    //Boton 4
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 80,
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
                  ],
                ),
              ],
            )),
          ),
          //4 Second Title
            Padding(
              padding: EdgeInsets.fromLTRB(18, spacetop, spaceright, spacebott),
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Personalizados',
                    style: titleLabel,
                  ),
                ),
              ),
            ),
          //5 Second Line
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Container(
                height: 1, // Altura de la l赤nea de separaci車n
                color: Colors.grey, // Color de la l赤nea de separaci車n
                margin: const EdgeInsets.symmetric(
                    vertical: 3), // Margen vertical para ajustar la separaci車n
              ),
            ),
          //6 Second Button Widget
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    //Boton 5
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 80,
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
                    //Boton 6
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 80,
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
                  ],
                ),
                Column(
                  children: [
                    //Boton 7
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 80,
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
                    //Boton 8
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(spaceleft, spacetop, spaceright, spacebott),
                        child: Container(
                          width: 80,
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
                  ],
                ),
              ],
            )),
          ),
           
            ],
          ),
          ),// Ultimo Container
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
    );
  }
}
