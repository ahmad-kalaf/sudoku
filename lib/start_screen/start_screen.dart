import 'package:flutter/material.dart';
import 'package:sudoku/play_screen/play_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('SUDOKU')),
      body: SizedBox.expand(
        child: FittedBox(
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayScreen()),
              );
            },
            icon: Icon(Icons.not_started_outlined, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
