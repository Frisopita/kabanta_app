import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final TextStyle signalabel = 
   const TextStyle(
    fontSize: 18.0,
    color: Colors.black,
    //backgroundColor: Colors.blue.shade100
  );
   final TextStyle timeLabel = 
   const TextStyle(
    fontSize: 25.0,
    color: Colors.black,
    //backgroundColor: Colors.blue.shade100
  );
  final TextStyle labelStyle = const TextStyle(
    fontSize: 16.0,
  );
  String textName1 = 'Now';
  String textName2 = 'Action 1';
  String textName3 = 'Action 2';
  String textName4 = 'Action 3';
  String textName5 = 'Action 4';
  String textName6 = 'Action 5';
  String textName7 = 'C1';

  String time1 = '00:00';
  String time2 = '00:20';
  String time3 = '00:45';
  String time4 = '00:58';
  String time5 = '01:02';
  String time6 = '03:00';
  String time7 = '03:55';

  Color colorbackbutt1 = Colors.blueGrey.shade300;
  Color colorforebutt1 = Colors.white;

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
                child: Text('00:00:00', style: timeLabel,),
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
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 //0
               
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.blueGrey.shade100,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Padding(
                          padding: const  EdgeInsets.fromLTRB(
                           5,//left
                           9, //top
                           5, //right
                           9 //botton
                           ),
                          child: Container(
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade300,
                              borderRadius: BorderRadius.circular(2)),
                            child: Center(child: Text('NS', style: signalabel,)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            width: 250,
                            height: 40,
                            child:Image.asset(
                              'Images/arryt.png',
                              fit: BoxFit.contain,
                            )
                          ),
                        ),
                      ],
                  ),
                             ),
              
              //2
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt1,
                            foregroundColor: colorforebutt1),
                          onPressed: () {}, child: const Text('Programado')),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt1,
                            foregroundColor: colorforebutt1),
                          onPressed: () {}, child: const Text('Historial')),
                    )
                  ],
                ),
              ),

              //3
              Expanded(
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
                      ],
                    ),
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
                      ],
                    ),
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
