import 'package:flutter/material.dart';

class QrTextProvider extends ChangeNotifier {
  String? text = '';
  TextEditingController textEditingController = TextEditingController();

  void updateText(String? newValue) {
    if (newValue == text) return;
    text = newValue;
    textEditingController.text = newValue ?? '';
    notifyListeners();
  }
}
