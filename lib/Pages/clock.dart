import 'package:flutter/material.dart';
import 'dart:async';

class ClockConfigScreen extends StatefulWidget {
  @override
  _ClockConfigScreenState createState() => _ClockConfigScreenState();
}

class _ClockConfigScreenState extends State<ClockConfigScreen> {
  TextEditingController _minutesController = TextEditingController();
  TextEditingController _secondsController = TextEditingController();
  int _totalSecondsRemaining = 0;
  Timer? _countdownTimer;

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
        _secondsController.text = currentSeconds.substring(0, currentSeconds.length - 1);
      });
    } else if (currentMinutes.isNotEmpty) {
      setState(() {
        _minutesController.text = currentMinutes.substring(0, currentMinutes.length - 1);
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
        title: Text('Countdown Timer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: _minutesController,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: InputDecoration(
                        labelText: 'Min',
                      ),
                      enabled: false, // Deshabilitar el campo de texto
                    ),
                  ),
                  Text(':', style: TextStyle(fontSize: 24)),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: _secondsController,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: InputDecoration(
                        labelText: 'Sec',
                      ),
                      enabled: false, // Deshabilitar el campo de texto
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () => _updateTextFieldValue(index.toString()),
                    child: Text(index.toString()),
                  );
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _deleteLastDigit,
                child: Text('Borrar'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: startCountdown,
                child: Text('Iniciar cuenta regresiva'),
              ),
              SizedBox(height: 20),
              Text(
                'Tiempo restante: ${formatTime(_totalSecondsRemaining ~/ 60)}:${formatTime(_totalSecondsRemaining % 60)}',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _minutesController.dispose();
    _secondsController.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }
}
