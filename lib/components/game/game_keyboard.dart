import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle_app/components/game/game_keyboard_key.dart';
import 'package:wordle_app/services/word_service_provider.dart';

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
              return Selector<WordService, Color>(
                selector: (context, wordService) {
                  return wordService.keys[label]!;
                },
                builder: ((context, keyColors, child) {
                  return GameKeyboardKey(label: label, keyColor: keyColors,);
                }
                )
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}