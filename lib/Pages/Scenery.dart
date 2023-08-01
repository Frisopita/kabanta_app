import 'package:flutter/material.dart';
import 'package:kabanta_app1/variables.dart';

class Scenery extends StatefulWidget {
  const Scenery({super.key});

  @override
  State<Scenery> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //0
           Container(
              height: 50,
              color: null,
            ),
          //1 First Title
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          18, spacetopV, spacerightV, spacebottV),
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
                        vertical:
                            3), // Margen vertical para ajustar la separaci車n
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
                            padding: EdgeInsets.fromLTRB(
                                spaceleftV, spacetopV, spacerightV, spacebottV),
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
                                child: Text(buttSN1),
                              ),
                            ),
                          ),
                          //Boton 2
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                spaceleftV, spacetopV, spacerightV, spacebottV),
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
                                child: Text(buttSN2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          //Boton 3
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                spaceleftV, spacetopV, spacerightV, spacebottV),
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
                                child: Text(buttSN3),
                              ),
                            ),
                          ),
                          //Boton 4
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                spaceleftV, spacetopV, spacerightV, spacebottV),
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
                                child: Text(buttSN4),
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
                  padding:
                      EdgeInsets.fromLTRB(18, spacetopV, spacerightV, spacebottV),
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
                        vertical:
                            3), // Margen vertical para ajustar la separaci車n
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
                            padding: EdgeInsets.fromLTRB(
                                spaceleftV, spacetopV, spacerightV, spacebottV),
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
                                child: Text(buttSN5),
                              ),
                            ),
                          ),
                          //Boton 6
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                spaceleftV, spacetopV, spacerightV, spacebottV),
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
                                child: Text(buttSN6),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          //Boton 7
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                spaceleftV, spacetopV, spacerightV, spacebottV),
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
                                child: Text(buttSN7),
                              ),
                            ),
                          ),
                          //Boton 8
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                spaceleftV, spacetopV, spacerightV, spacebottV),
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
                                child: Text(buttSN8),
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
          //2
          Container(
              height: 80,
            ),
          ],
      ),
    );
  }
}
