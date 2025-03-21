import 'package:flutter/material.dart';
import 'package:wordle_app/components/game/game_word_tile.dart';

class GameWordGrid extends StatelessWidget {
  const GameWordGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 5,
      children: List.generate(
        30, 
        (index) => GameWordTile(),
      ),
    );
  }
}