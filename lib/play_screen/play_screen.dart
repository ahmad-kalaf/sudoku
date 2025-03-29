import 'dart:math';

import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final List<int> buttonsNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  int? selectedFieldIndex;
  List<int> solutions = List.generate(81, (index) => Random().nextInt(10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // Äußere Raster
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
                          child: Text(solutions[index] == 0 ? '' : solutions[index].toString()),
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
                        if (selectedFieldIndex != null) {
                          setState(() {
                            solutions[selectedFieldIndex!] = buttonsNumbers[idx];
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
