// ignore: file_names
import 'package:flutter/material.dart';
import 'package:kabanta_app1/providers/clock_provider.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:provider/provider.dart';

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
  bool isButtonActive = false;
  bool isProgramActive = true;
  bool isHistoryActive = false;
  List<ExpansionTile> expansionTiles = [];

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
          height: 60,
          width: MediaQuery.of(context).size.width,
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
                          setState(() {
                            isProgramActive = true;
                            isHistoryActive = false;
                            isButtonActive = false;
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
                            isButtonActive = true;
                          });
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
            child: isProgramActive
                ? ProgramContainer(expansionTiles: expansionTiles)
                : const HistoryContainer(
                    listTiles: [],
                  ), // Mostrar el contenido relevante
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

class ProgramContainer extends StatefulWidget {
  const ProgramContainer({
    super.key,
    required this.expansionTiles,
  });

  final List<ExpansionTile> expansionTiles;

  @override
  State<ProgramContainer> createState() => _ProgramContainerState();
}

class _ProgramContainerState extends State<ProgramContainer> {
  bool execute = false;

  void removeExpansionTile(int index) {
    setState(() {
      if (index >= 0 && index < widget.expansionTiles.length) {
        widget.expansionTiles.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    ExpansionTile _generateExpansionTile(UIState state) {
      String statesText = '';
      switch (state.id) {
        case 1:
          statesText = buttECG1;
          break;
        case 2:
          statesText = buttECG2;
          break;
        case 3:
          statesText = buttECG3;
          break;
        case 4:
          statesText = buttECG4;
          break;
        case 5:
          statesText = buttECG5;
          break;
        case 6:
          statesText = buttECG6;
          break;
        case 7:
          statesText = buttECG7;
          break;
        case 8:
          statesText = buttECG8;
          break;
        case 9:
          statesText = buttECG9;
          break;
        case 10:
          statesText = buttECG10;
          break;
        case 11:
          statesText = buttECG11;
          break;
        case 12:
          statesText = buttECG12;
          break;
        case 13:
          statesText = buttECG13;
          break;
        case 14:
          statesText = buttECG14;
          break;
        case 15:
          statesText = buttECG15;
          break;
        case 16:
          statesText = buttECG16;
          break;
        case 17:
          statesText = buttECG17;
          break;
        case 18:
          statesText = buttECG18;
          break;
        case 19:
          statesText = buttECG19;
          break;
        default:
          statesText = '';
          break;
      }

      return ExpansionTile(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
          child: Row(
            children: [
              Text('${state.index}'),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 10, 0),
                child: Row(
                  children: [
                    Text(statesText),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                      child: Text(
                          '${(state.duration.inMinutes).toString().padLeft(2, '0')}:${(state.duration.inSeconds % 60).toString().padLeft(2, '0')}'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Content of Action ${state.index}'),
          ),
        ],
      );
    }

    return Selector<ClockService, List<UIState>>(
      selector: (_, clockService) => clockService.uiStates,
      builder: (context, list, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: list.map(_generateExpansionTile).toList(),
        );
      },
    );
  }
}

class HistoryContainer extends StatefulWidget {
  const HistoryContainer({super.key, required this.listTiles});

  final List<ListTile> listTiles;

  @override
  State<HistoryContainer> createState() => _HistoryContainerState();
}

class _HistoryContainerState extends State<HistoryContainer> {
  ListTile _generateListTile(ActivityTimer state) {
    String statesText = '';
    switch (state.type) {
      case 1:
        statesText = buttECG1;
        break;
      case 2:
        statesText = buttECG2;
        break;
      case 3:
        statesText = buttECG3;
        break;
      case 4:
        statesText = buttECG4;
        break;
      case 5:
        statesText = buttECG5;
        break;
      case 6:
        statesText = buttECG6;
        break;
      case 7:
        statesText = buttECG7;
        break;
      case 8:
        statesText = buttECG8;
        break;
      case 9:
        statesText = buttECG9;
        break;
      case 10:
        statesText = buttECG10;
        break;
      case 11:
        statesText = buttECG11;
        break;
      case 12:
        statesText = buttECG12;
        break;
      case 13:
        statesText = buttECG13;
        break;
      case 14:
        statesText = buttECG14;
        break;
      case 15:
        statesText = buttECG15;
        break;
      case 16:
        statesText = buttECG16;
        break;
      case 17:
        statesText = buttECG17;
        break;
      case 18:
        statesText = buttECG18;
        break;
      case 19:
        statesText = buttECG19;
        break;
      default:
        statesText = '';
        break;
    }

    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text('${state.id}'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(statesText),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
                '${state.duration.inMinutes.toString().padLeft(2, '0')}:${(state.duration.inSeconds % 60).toString().padLeft(2, '0')}'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ClockService, List<ActivityTimer>>(
      selector: (_, clockService) => clockService.activities,
      builder: (context, list, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              list.map((activities) => _generateListTile(activities)).toList(),
        );
      },
    );
  }
}