import 'package:flutter/material.dart';
import 'package:kabanta_app1/main.dart';
import 'package:kabanta_app1/variables.dart';
import 'dart:async';

class ClockConfigScreen extends StatefulWidget {
  const ClockConfigScreen({super.key});

  @override
  State<ClockConfigScreen> createState() => _ClockConfigScreenState();
}

class _ClockConfigScreenState extends State<ClockConfigScreen> {
  int seconds = 0;
  int minutes = 0;
  Duration duration = Duration.zero;
  Timer? _countdownTimer;

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    if (_countdownTimer != null) {
      _countdownTimer!.cancel();
    }

    setState(() => duration = Duration(minutes: minutes, seconds: seconds));
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        duration -= const Duration(seconds: 1);
        if (duration == Duration.zero) {
          minutes = 0;
          seconds = 0;
          _countdownTimer!.cancel();
        }
      });
    });
  }

  void _updateTime(int value, [bool double = false]) {
    if ((minutes >= 10 && seconds >= 10) || (double && minutes != 0)) {
      return;
    }

    setState(() {
      int multiplier = double ? 100 : 10;
      if (seconds < 10 && !double) {
        seconds = seconds * multiplier + value;
      } else {
        final allSeconds = (seconds * multiplier) + value;
        seconds = allSeconds % 100;
        minutes = minutes * 10 + ((allSeconds - seconds) ~/ 100);
      }
    });
  }

  void _deleteDigit() {
    if (seconds == 0 && minutes == 0) {
      return;
    }

    setState(() {
      seconds = seconds ~/ 10 + ((minutes % 10) * 10);
      minutes = minutes ~/ 10;
    });
  }

  bool get enable => duration == Duration.zero;

  String formatTime(int time) {
    return time.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      backgroundColor: colorbackbutt4,
      foregroundColor: colorforebutt4,
    );
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'Images/original.png',
          fit: BoxFit.cover,
          height: 100,
          width: 130,
        ),
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: minutes.toString().padLeft(2, '0'),
                children: [
                  const TextSpan(
                    text: ' : ',
                    style: TextStyle(letterSpacing: -6),
                  ),
                  TextSpan(text: seconds.toString().padLeft(2, '0')),
                ],
              ),
              style: numTime,
              maxLines: 1,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text(
                    'Min',
                    style: nameTime,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text(
                    'Sec',
                    style: nameTime,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 40,
                    width: 110,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: confirmBbutt1,
                          foregroundColor: confirmFbutt1),
                      onPressed: () {
                        Navigator.of(context).pop(MaterialPageRoute(
                          builder: (BuildContext context) => const DataPage(),
                        ));
                      },
                      child:
                          const Text('Confirm', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: SizedBox(
                    height: 40,
                    width: 110,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cancelBbutt2,
                        foregroundColor: cancelFbutt2,
                      ),
                      onPressed: () {
                        setState(() {
                          duration = Duration.zero;
                          minutes = 0;
                          seconds = 0;
                          _countdownTimer?.cancel();
                        });
                      },
                      child: const Text(
                        'Clear',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(280, 220)),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  mainAxisExtent: 50,
                ),
                itemBuilder: (context, index) {
                  final value = index + 1;
                  return switch (index) {
                    < 9 => ElevatedButton(
                        style: style,
                        onPressed: enable ? () => _updateTime(value) : null,
                        child: Text(
                          '$value',
                          style: const TextStyle(fontSize: 23),
                        ),
                      ),
                    9 => ElevatedButton(
                        style: style,
                        onPressed: enable ? () => _updateTime(0, true) : null,
                        child: const Text(
                          '00',
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                    10 => ElevatedButton(
                        style: style,
                        onPressed: enable ? () => _updateTime(0) : null,
                        child: const Text(
                          '0',
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                    11 => IconButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cancelBbutt2,
                          foregroundColor: cancelFbutt2,
                        ),
                        onPressed: enable ? _deleteDigit : null,
                        icon: const Icon(Icons.backspace),
                      ),
                    _ => const SizedBox(),
                  };
                },
                itemCount: 12,
              ),
            ),
            ElevatedButton(
              onPressed: startCountdown,
              child: const Text('Iniciar cuenta regresiva'),
            ),
            Text(
              'Tiempo restante: ${formatTime(duration.inMinutes)}:${formatTime(duration.inSeconds % 60)}',
            ),
          ],
        ),
      ),
    );
  }
}
