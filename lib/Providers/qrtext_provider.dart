import 'package:flutter/material.dart';

class QrTextProvider extends ChangeNotifier {
  String? text = '';

  String? get currentText => text; // Getter para obtener el valor actual

  void updateText(String? newValue) {
    text = newValue;
    notifyListeners();
  }
}
