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
              title: const Text('Click'),
              content: const Text('Al hacer un click se envian los datos predeterminados de esta funcion y no se muestra esta box'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el AlertDialog
                  },
                  child: const Text('OK'),
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
             title: const Text('Long Click'),
              content: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Al hacer un click largo se despliga la informacion de los datos enviados, ejemplo: '),
                    ),
                   
                    Row(
                      children: [
                        Image.asset('Icons/corazon.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('Heart Rate: '),
                              Text('250', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/temperatura.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('Temperature: '),
                              Text('36', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/o2.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('SpO2: '),
                              Text('70', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/pressure.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('Sys Pressure: '),
                              Text('60', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/pressure.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding:  EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('Dias Pressure: '),
                              Text('35', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/pulso.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('Frequency Rate: '),
                              Text('8', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('Icons/co2.png',
                                width: 20,
                                height: 20,),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text('CO2: '),
                              Text('6', style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el AlertDialog
                  },
                  child: const Text('OK'),
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
            _isButtonLongPressed ? "Test Butt" : "Test Butt",
            style: const TextStyle(color: Colors.indigo),
          ),
        ),
      ),
    );
  }
}
