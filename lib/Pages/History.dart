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
          title: Text('Expansion Tile $newIndex'),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Content for Expansion Tile $newIndex'),
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
        SizedBox(
          child: ElevatedButton(
              onPressed: () {
                createExpansionTile();
              },
              child: Text('add')),
        ),
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

      color: Colors.pink.shade200,
      child: const Text('Datos'),
    );
  }
}
