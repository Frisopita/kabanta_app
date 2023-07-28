import 'package:flutter/material.dart';
import 'package:kabanta_app1/main.dart';
import 'package:kabanta_app1/variables.dart';

class ClockConfigScreen extends StatefulWidget {
  const ClockConfigScreen({super.key});

  @override
  State<ClockConfigScreen> createState() => _ClockConfigScreenState();
}

class _ClockConfigScreenState extends State<ClockConfigScreen> {
  String mins1 = '0';
  String mins2 = '0';
  String segs1 = '0';
  String segs2 = '0';

  int number = 0;
  int number1 = 0;
  int number2 = 0;
  int number3 = 0;
  int number4 = 0;
  int number5 = 0;
  int number6 = 0;
  int number7 = 0;
  int number8 = 0;
  int number9 = 0;
  int number0 = 0;

  void delateNumber(int newNumber) {
    setState(() {
      number = newNumber;
    });
  }

  void updateNumber1(int newNumber) {
    setState(() {
      number1 = newNumber;
    });
  }

  void updateNumber2(int newNumber) {
    setState(() {
      number2 = newNumber;
    });
  }

  void updateNumber3(int newNumber) {
    setState(() {
      number3 = newNumber;
    });
  }

  void updateNumber4(int newNumber) {
    setState(() {
      number4 = newNumber;
    });
  }

  void updateNumber5(int newNumber) {
    setState(() {
      number5 = newNumber;
    });
  }

  void updateNumber6(int newNumber) {
    setState(() {
      number6 = newNumber;
    });
  }

  void updateNumber7(int newNumber) {
    setState(() {
      number7 = newNumber;
    });
  }

  void updateNumber8(int newNumber) {
    setState(() {
      number8 = newNumber;
    });
  }

  void updateNumber9(int newNumber) {
    setState(() {
      number9 = newNumber;
    });
  }

  void updateNumber0(int newNumber) {
    setState(() {
      number0 = newNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/original.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          mins1,
                          style: numTime,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          mins2,
                          style: numTime,
                        ),
                      ),
                      const Text(':', style: numTime),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          segs1,
                          style: numTime,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          segs2,
                          style: numTime,
                        ),
                      ),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Min',
                        style: nameTime,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Seg',
                        style: nameTime,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: confirmBbutt1,
                            foregroundColor: confirmFbutt1),
                        onPressed: () {
                          Navigator.of(context).pop(MaterialPageRoute(
                            builder: (BuildContext context) => const DataPage(),
                          ));
                        },
                        child: const Text('Confirm',
                            style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: cancelBbutt2,
                              foregroundColor: cancelFbutt2),
                          onPressed: () {
                            delateNumber(0);
                            mins1 = number.toString();
                            mins2 = number.toString();
                            segs1 = number.toString();
                            mins2 = number.toString();
                          },
                          child: const Text('Cancel',
                              style: TextStyle(fontSize: 16))),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {
                          updateNumber1(1);
                          mins1 = number1.toString();
                        },
                        child: const Text('1'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {
                          updateNumber2(2);
                          mins1 = number2.toString();
                        },
                        child: const Text('2'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {
                          updateNumber3(3);
                          mins1 = number3.toString();
                        },
                        child: const Text('3'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {
                          updateNumber4(4);
                          mins1 = number4.toString();
                        },
                        child: const Text('4'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {
                          updateNumber5(5);
                          mins1 = number5.toString();
                        },
                        child: const Text('5'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {
                          updateNumber6(6);
                          mins1 = number6.toString();
                        },
                        child: const Text('6'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {
                          updateNumber7(7);
                          mins1 = number7.toString();
                        },
                        child: const Text('7'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {
                          updateNumber8(8);
                          mins1 = number8.toString();
                        },
                        child: const Text('8'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {
                          updateNumber9(9);
                          mins1 = number9.toString();
                        },
                        child: const Text('9'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {
                          updateNumber0(0);
                          mins1 = number0.toString();
                        },
                        child: const Text('0'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: IconButton(
                        icon: const Icon(Icons.backspace),
                        onPressed: () {
                          delateNumber(0);
                          mins1 = number.toString();
                          mins2 = number.toString();
                          segs1 = number.toString();
                          mins2 = number.toString();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
