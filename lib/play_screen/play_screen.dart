import 'dart:math';

import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  // beschriftung der buttons
  final List<int> buttonsNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  // aktuell ausgewählte feld
  int? selectedFieldIndex;

  /* für jedes feld gibt es drei zahlen:
  * numbers[0] ist die korrekte antwort die vom sudoku-algorithmus bestimmt wurde
  * numbers[0] wird nur dem spieler angezeigt, wenn zahl != 0, sonst leeres feld
  * numbers[1] ist die eingegebene zahl vom spieler (wenn noch nichts eingegeben dann zahl = -1) */
  List<List<int>> numbers = List.generate(81, (index) => [Random().nextInt(10), -1]);

  // indizes von feldern die vom benutzer bearbeitet werden dürfen
  List<int> modifiableFields = [];

  @override
  void initState() {
    for (List<int> element in numbers) {
      element.first == 0 ? modifiableFields.add(numbers.indexOf(element)) : null;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
                  itemCount: 81,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFieldIndex == index ? selectedFieldIndex = null : selectedFieldIndex = index;
                        });
                      },
                      child: SizedBox.expand(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: selectedFieldIndex == index ? Colors.blue[200] : null),
                          child: Text(numbers[index][0] == 0 ? '' : numbers[index][0].toString()),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(10, (idx) {
                  return Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedFieldIndex != null && modifiableFields.contains(selectedFieldIndex)) {
                          setState(() {
                            numbers[selectedFieldIndex!][0] = buttonsNumbers[idx];
                          });
                        }
                      },
                      child: Text(buttonsNumbers[idx].toString()),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
