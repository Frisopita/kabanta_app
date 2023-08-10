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
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              //color: Colors.pink.shade100,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('History'))),
                    SizedBox(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Program'))),
                  ],
                ),
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
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              '0',
                              style: labelStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              '1',
                              style: labelStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              '2',
                              style: labelStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              '3',
                              style: labelStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              '4',
                              style: labelStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              '5',
                              style: labelStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              '6',
                              style: labelStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              '7',
                              style: labelStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
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
            //3
            Container(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
