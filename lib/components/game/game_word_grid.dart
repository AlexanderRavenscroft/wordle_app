import 'package:flutter/material.dart';
import 'package:wordle_app/components/game/game_word_tile.dart';
import 'package:wordle_app/services/word_service.dart';

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
        String letter = (row < WordService.guesses.length && col < WordService.guesses[row].length)
          ? WordService.guesses[row][col]
          : '';
        return GameWordTile(letter: letter);
      },
    );
  }
}