import 'package:flutter/material.dart';
import 'package:wordle_app/components/game_keyboard_key.dart';

class GameKeyboard extends StatelessWidget {
  GameKeyboard({super.key});

  final List<List<String>> keys = [
    ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
    ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'BACKSPACE'],
  ];
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: keys.map((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((label) {
              return GameKeyboardKey(label: label);
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}