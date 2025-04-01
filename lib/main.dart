import 'package:flutter/material.dart';
import 'package:sudoku/start_screen/start_screen.dart';

void main() {
  runApp(const SudokuGame());
}

class SudokuGame extends StatelessWidget {
  const SudokuGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: StartScreen());
  }
}
