// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:kabanta_app1/Providers/states.dart';
import 'package:kabanta_app1/providers/clock_provider.dart';
import 'package:kabanta_app1/variables.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'dart:async';



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
                : HistoryContainer(), // Mostrar el contenido relevante
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
  int index = 0;
  bool execute = false;

  void removeExpansionTile(int index) {
    setState(() {
      if (index >= 0 && index < widget.expansionTiles.length) {
        widget.expansionTiles.removeAt(index);
      }
    });
  }

  ExpansionTile _generateExpansionTile(UIState state) {
    String stateText = '';
  switch (state.id) {
    case 0:
      stateText = 'First State1 Text';
      break;
    case 1:
      stateText = 'Heart Attack';
      break;
    // Agrega m��s casos seg��n sea necesario
    default:
      stateText = 'Default State1 Text';
      break;
  }    
    if (state.duration.inSeconds == 1 && !execute ) {
      context.read<BleStateProvider>().updateCharacteristic(state1);
      execute = true;
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
                  Text('${stateText}'),
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
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          context.read<ClockService>().deleteState(state.index);
        },
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Content of Action ${state.index}'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ClockService, List<UIState>>(
      selector: (_, clockService) => clockService.uiStates,
      //shouldRebuild: (previous, next) => const DeepCollectionEquality()
      //.equals(previous, next),
      builder: (context, list, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: list.map(_generateExpansionTile).toList(),
        );
      },
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
