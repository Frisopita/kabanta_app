import 'package:flutter/material.dart';
import 'package:kabanta_app1/variables.dart';

class ClockConfigScreen extends StatefulWidget {
  const ClockConfigScreen({super.key});

  @override
  State<ClockConfigScreen> createState() => _ClockConfigScreenState();
}

class _ClockConfigScreenState extends State<ClockConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/original.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: Colors.white,
        leading: const BackButton( color: Colors.black,),
        // automaticallyImplyLeading: false,
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
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Min',
                          style: nameTime,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '00:00',
                          style: numTime,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Seg',
                          style: nameTime,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '00:00',
                          style: numTime,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: confirmBbutt1,
                              foregroundColor: confirmFbutt1),
                          onPressed: () {},
                          child: const Text('Confirm')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: cancelBbutt2,
                              foregroundColor: cancelFbutt2),
                          onPressed: () {},
                          child: const Text('Cancel')),
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
                        onPressed: () {},
                        child: const Text('1'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {},
                        child: const Text('2'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {},
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
                        onPressed: () {},
                        child: const Text('4'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {},
                        child: const Text('5'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {},
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
                        onPressed: () {},
                        child: const Text('7'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {},
                        child: const Text('8'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {},
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
                        onPressed: () {},
                        child: const Text('00'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () {},
                        child: const Text('0'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: IconButton(
                        icon: const Icon(Icons.backspace),
                        onPressed: () {},
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
