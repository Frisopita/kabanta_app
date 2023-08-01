import 'package:flutter/material.dart';

class DualActionButton extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  DualActionButton({required this.onTap, required this.onLongPress});

  @override
  _DualActionButtonState createState() => _DualActionButtonState();
}

class _DualActionButtonState extends State<DualActionButton> {
  bool _isButtonLongPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Muestra el AlertDialog al hacer clic
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('AlertDialog OnTap Title'),
              content: Text('This is the content of the AlertDialog.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el AlertDialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        widget.onTap();
      },
      onLongPress: () {
        // Muestra el AlertDialog al dejar presionado
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('AlertDialog OnLongPress Title'),
              content: Text('This is the content of the Long Press AlertDialog.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el AlertDialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        setState(() {
          _isButtonLongPressed = true;
        });
        widget.onLongPress();
      },
      onLongPressUp: () {
        setState(() {
          _isButtonLongPressed = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isButtonLongPressed = false;
        });
      },
      child: Container(
        width: 95,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(-1, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            _isButtonLongPressed ? "2" : "1",
            style: TextStyle(color: Colors.indigo),
          ),
        ),
      ),
    );
  }
}
