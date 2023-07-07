import 'package:flutter/material.dart';
import 'variables.dart';

class ContainerSignal extends StatelessWidget {
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
            height: 1, // Altura de la l赤nea de separaci車n
            color: Colors.grey.shade300, // Color de la l赤nea de separaci車n
            margin: const EdgeInsets.symmetric(vertical: 0),
          ),
        ],
      ),
    );
  }
}

class ContainerClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 1, // Altura de la l赤nea de separaci車n
            color: Colors.grey.shade300, // Color de la l赤nea de separaci車n
            margin: const EdgeInsets.symmetric(vertical: 0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.stop),
                onPressed: () {},
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
