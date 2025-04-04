import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle_app/components/game/game_word_tile.dart';
import 'package:wordle_app/services/word_service_provider.dart';
import 'package:wordle_app/themes/themes.dart';

class GameWordGrid extends StatelessWidget {
  const GameWordGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 1,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        int row = index ~/ 5;
        int col = index % 5;
        return Selector<WordService, String>(  
          selector: (context, wordService) {
            if (row < wordService.guesses.length &&
                col < wordService.guesses[row].length) {
              return wordService.guesses[row][col].keys.first;
            } else {
              return ''; // Return an empty string if out of bounds
            }
          },
          builder: (context, letter, child) {   
            return Selector<WordService, Color>(
              selector: (context, wordService) {
                if (row < wordService.guesses.length &&
                  col < wordService.guesses[row].length) {
                return wordService.guesses[row][col].values.first;
              } else {
                return AppColors.background; 
              }
            },
              builder: (context, tileColors, child) {
                return GameWordTile(letter: letter, color: tileColors);
              },
            );
          },
        );
      },
    );
  } 
}