import 'package:flutter/material.dart';
import 'package:kabanta_app1/variables.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HistoryContent(),
      ),
    );
  }
}

class HistoryContent extends StatefulWidget {
  const HistoryContent({
    super.key,
  });

  @override
  State<HistoryContent> createState() => _HistoryContentState();
}

class _HistoryContentState extends State<HistoryContent> {
  bool isButtonActive = true;
  bool isProgramActive = true; // Agregado
  bool isHistoryActive = false; // Agregado
  List<ExpansionTile> expansionTiles = [];

  int index = 0;

  @override
  void toggleButtonColor() {
    setState(() {
      isButtonActive = !isButtonActive;
    });
  }

  void removeExpansionTile(int index) {
    setState(() {
      if (index >= 0 && index < expansionTiles.length) {
        expansionTiles.removeAt(index);
      }
    });
  }

  void createExpansionTile() {
    int newIndex =
        expansionTiles.length + 1; // Usar una nueva variable de ¨ªndice
    setState(() {
      expansionTiles.add(
        ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
            child: Row(
              children: [
                Text('$newIndex'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 10, 0),
                  child: Text('Action $newIndex'),
                ),
              ],
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Content of Action $newIndex'),
            ),
          ],
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              removeExpansionTile(index);
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //0
        Container(
          height: 50,
          color: null,
        ),
        //1
        /*SizedBox(
          child: ElevatedButton(
              onPressed: () {
                createExpansionTile();
              },
              child: Text('add')),
        ),*/
        //2
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          //color: Colors.pink.shade100,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(88, 9, 88, 9),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey.shade300,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 3, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.26,
                      child: ElevatedButton(
                        onPressed: () {
                          toggleButtonColor();
                          createExpansionTile();
                          setState(() {
                            isProgramActive = true;
                            isHistoryActive = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: isButtonActive ? 0 : 1,
                          backgroundColor: isButtonActive
                              ? Colors.grey.shade300
                              : Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Program'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 0, 2, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.26,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isProgramActive = false;
                            isHistoryActive = true;
                          });
                          toggleButtonColor();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: isButtonActive ? 1 : 0,
                          backgroundColor: isButtonActive
                              ? Colors.white
                              : Colors.grey.shade300,
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('History'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //3
        Expanded(
          child: SingleChildScrollView(
            child: isProgramActive
                ? ProgramContainer(expansionTiles: expansionTiles)
                : HistoryContainer(), // Mostrar el contenido relevante
          ),
        ),
        //4
        Container(
          height: 80,
        ),
      ],
    );
  }
}

class ProgramContainer extends StatelessWidget {
  const ProgramContainer({
    super.key,
    required this.expansionTiles,
  });

  final List<ExpansionTile> expansionTiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          if (expansionTiles.isNotEmpty)
            ...expansionTiles.asMap().entries.map((entry) {
              final index = entry.key;
              final tile = entry.value;
              return Column(
                children: [
                  tile,
                  Divider(), // Opcional: agregar una l¨ªnea divisoria
                ],
              );
            }),
        ],
      ),
    );
  }
}

class HistoryContainer extends StatelessWidget {
  const HistoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.pink.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '0',
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '1',
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '2',
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '3',
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '4',
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '5',
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '6',
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '7',
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '8',
                  style: labelStyle,
                ),
              ),
            ],
          ),
          //2
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  textName1,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  textName2,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  textName3,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  textName4,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  textName5,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  textName6,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  textName7,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  textName8,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  textName9,
                  style: labelStyle,
                ),
              ),
            ],
          ),
          //3
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  time1,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  time2,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  time3,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  time4,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  time5,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  time6,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  time7,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  time8,
                  style: labelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  time9,
                  style: labelStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
