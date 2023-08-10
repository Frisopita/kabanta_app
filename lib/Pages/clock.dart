import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/main.dart';
import 'package:kabanta_app1/variables.dart';
import 'dart:async';

class ClockConfigScreen extends StatefulWidget {
  const ClockConfigScreen({super.key});

  @override
  State<ClockConfigScreen> createState() => _ClockConfigScreenState();
}

class _ClockConfigScreenState extends State<ClockConfigScreen> {
  TextEditingController _minutesController = TextEditingController();
  TextEditingController _secondsController = TextEditingController();
  int _totalSecondsRemaining = 0;
  Timer? _countdownTimer;

  @override
  void dispose() {
    _minutesController.dispose();
    _secondsController.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    int minutes = int.tryParse(_minutesController.text) ?? 0;
    int seconds = int.tryParse(_secondsController.text) ?? 0;
    int totalSeconds = minutes * 60 + seconds;

    setState(() {
      _totalSecondsRemaining = totalSeconds;
    });

    if (_countdownTimer != null) {
      _countdownTimer!.cancel();
    }

    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_totalSecondsRemaining > 0) {
          _totalSecondsRemaining--;
        } else {
          _countdownTimer!.cancel();
        }
      });
    });
  }

  void _updateTextFieldValue(String value) {
    final currentMinutes = _minutesController.text;
    final currentSeconds = _secondsController.text;

    if (currentMinutes.length < 2) {
      setState(() {
        _minutesController.text = currentMinutes + value;
      });
    } else if (currentSeconds.length < 2) {
      setState(() {
        _secondsController.text = currentSeconds + value;
      });
    }
  }

  void _deleteLastDigit() {
    final currentMinutes = _minutesController.text;
    final currentSeconds = _secondsController.text;

    if (currentSeconds.isNotEmpty) {
      setState(() {
        _secondsController.text =
            currentSeconds.substring(0, currentSeconds.length - 1);
      });
    } else if (currentMinutes.isNotEmpty) {
      setState(() {
        _minutesController.text =
            currentMinutes.substring(0, currentMinutes.length - 1);
      });
    }
  }

  String formatTime(int time) {
    return time.toString().padLeft(2, '0');
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
                
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 90,
                        width: 100,
                        child: TextField(
                          controller: _minutesController,
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          style: numTime,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            //labelText: 'Min',
                            hintText: '00',
                            hintStyle: numTime,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          enabled: false, // Deshabilitar el campo de texto
                        ),
                      ),
                      const SizedBox(
                        height: 90,
                        child: Text(':', style: numTime)),
                      SizedBox(
                        height: 90,
                        width: 100,
                        child: TextField(
                          controller: _secondsController,
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          style: numTime,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            //labelText: 'Seg',
                            hintText: '00',
                            hintStyle: numTime,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          enabled: false,
                        ),
                      ),
                    ],
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
                        'Sec',
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
                          onPressed: _deleteLastDigit,
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
                        onPressed: () => _updateTextFieldValue(1.toString()),
                        child: Text(1.toString()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () => _updateTextFieldValue(2.toString()),
                        child: Text(2.toString()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () => _updateTextFieldValue(3.toString()),
                        child: Text(3.toString()),
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
                        onPressed: () => _updateTextFieldValue(4.toString()),
                        child: Text(4.toString()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () => _updateTextFieldValue(5.toString()),
                        child: Text(5.toString()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () => _updateTextFieldValue(6.toString()),
                        child: Text(6.toString()),
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
                        onPressed: () => _updateTextFieldValue(7.toString()),
                        child: Text(7.toString()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () => _updateTextFieldValue(8.toString()),
                        child: Text(8.toString()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorbackbutt4,
                            foregroundColor: colorforebutt4),
                        onPressed: () => _updateTextFieldValue(9.toString()),
                        child: Text(9.toString()),
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
                        onPressed: () => _updateTextFieldValue(0.toString()),
                        child: Text(0.toString()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: IconButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: cancelBbutt2,
                              foregroundColor: cancelFbutt2),
                          onPressed: _deleteLastDigit,
                          icon: const Icon(Icons.backspace),
                    ),
                    ),
                  ],
                ),
                
                /*ElevatedButton(
                  onPressed: startCountdown,
                  child: const Text('Iniciar cuenta regresiva'),
                ),
                Text(
                  'Tiempo restante: ${formatTime(_totalSecondsRemaining ~/ 60)}:${formatTime(_totalSecondsRemaining % 60)}',
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
