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
    int index = expansionTiles.length + 1;
    setState(() {
      expansionTiles.add(
        ExpansionTile(
          title: Text('Expansion Tile $index'),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Content for Expansion Tile $index'),
            ),
          ],
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              removeExpansionTile(
                  index - 1); // Resta 1 para obtener el ¨ªndice correcto
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
        //
        //
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
                        onPressed: toggleButtonColor,
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
                          toggleButtonColor();
                          createExpansionTile();
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
        //2
        Expanded(
  child: SingleChildScrollView(
    child: Container(
      child: Column(
        children: List.generate(
          expansionTiles.length,
          (tileIndex) { // Cambia el nombre de la variable index aqu¨ª
            if (tileIndex == 0) {
              return Container(); // Mostrar un Container vac¨ªo en el ¨ªndice 0
            } else {
              return Column(
                children: [
                  expansionTiles[tileIndex],
                 const Divider(), // Opcional: agregar una l¨ªnea divisoria
                ],
              );
            }
          },
        ),
      ),
    ),
  ),
),
        //3
        Container(
          height: 80,
        ),
      ],
    );
  }
}
