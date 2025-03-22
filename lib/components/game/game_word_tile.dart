import 'package:flutter/material.dart';
import 'package:wordle_app/themes/themes.dart';

class GameWordTile extends StatelessWidget {
  final String letter;
  const GameWordTile({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final paddingValue = (screenWidth < screenHeight ? screenWidth : screenHeight) * 0.006;
    return Padding(
      padding: EdgeInsets.all(paddingValue),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(
            width: 2,
            color: AppColors.surface,
          ),
        ),
        child: Center(
          child: Text(
            letter,
            style: AppTypography.wordStyle.copyWith(
              fontSize: MediaQuery.of(context).size.height * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}