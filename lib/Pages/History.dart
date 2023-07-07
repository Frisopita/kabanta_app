import 'package:flutter/material.dart';
import 'package:kabanta_app1/variables.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

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
                  color:
                      Colors.grey.shade300, // Color de la l赤nea de separaci車n
                  margin: const EdgeInsets.symmetric(vertical: 0),
                ),
              ],
            ),
          ),

          //2
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //1
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '0',
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '1',
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '2',
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '3',
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '4',
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '5',
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '6',
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '7',
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '8',
                            style: labelStyle,
                          ),
                        ),
                      ],
                    ),
                    //2
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            textName1,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            textName2,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            textName3,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            textName4,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            textName5,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            textName6,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            textName7,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            textName8,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            textName9,
                            style: labelStyle,
                          ),
                        ),
                      ],
                    ),
                    //3
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            time1,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            time2,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            time3,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            time4,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            time5,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            time6,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            time7,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            time8,
                            style: labelStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            time9,
                            style: labelStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 1, // Altura de la l赤nea de separaci車n
                  color:
                      Colors.grey.shade300, // Color de la l赤nea de separaci車n
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
