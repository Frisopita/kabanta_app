import 'package:flutter/material.dart';
import 'variables.dart';
import 'dart:async';

class ContainerSignal extends StatelessWidget {
  const ContainerSignal({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: const Center(
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
            height: 1, // Altura de la l��nea de separaci��n
            color: Colors.grey.shade300, // Color de la l��nea de separaci��n
            margin: const EdgeInsets.symmetric(vertical: 0),
          ),
        ],
      ),
    );
  }
}

class ContainerClock extends StatefulWidget {
  const ContainerClock({super.key});

  @override
  State<ContainerClock> createState() => _ContainerClockState();
}

class _ContainerClockState extends State<ContainerClock> {
  // Initialize an instance of Stopwatch
  final Stopwatch _stopwatch = Stopwatch();

  // Timer
  late Timer _timer;

  // The result which will be displayed on the screen
  String _result = '00:00:00';

  // This function will be called when the user presses the Start button
  void _start() {
    // Timer.periodic() will call the callback function every 100 milliseconds
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      // Update the UI
      setState(() {
        // result in hh:mm:ss format
        _result =
            '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inMilliseconds % 100).toString().padLeft(2, '0')}';
      });
    });
    // Start the stopwatch
    _stopwatch.start();
  }

  // This function will be called when the user presses the Stop button
  void _stop() {
    _timer.cancel();
    _stopwatch.stop();
  }

  // This function will be called when the user presses the Reset button
  void _reset() {
    _stop();
    _stopwatch.reset();

    // Update the UI
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 1, // Altura de la l��nea de separaci��n
            color: Colors.grey.shade300, // Color de la l��nea de separaci��n
            margin: const EdgeInsets.symmetric(vertical: 0),
          ),
          Center(
            child: Text(
              _result,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {
                  _start();
                },
              ),
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () {
                  _stop();
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop),
                onPressed: () {
                  _reset();
                },
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
    );
  }
}