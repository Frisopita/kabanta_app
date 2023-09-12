import 'package:flutter/material.dart';

class ClockTime extends ChangeNotifier {
  Duration? firstDuration = Duration.zero;

  void setClockTimer(Duration? c) {
    firstDuration = c;
    notifyListeners();
  }
}
