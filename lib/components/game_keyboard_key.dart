import 'package:flutter/material.dart';
import 'package:wordle_app/themes/themes.dart';

class GameKeyboardKey extends StatelessWidget {
  final String label;
  const GameKeyboardKey({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final paddingValue = (screenWidth < screenHeight ? screenWidth : screenHeight) * 0.006;
    bool isSpecial = (label == "BACKSPACE" || label == "ENTER");
    return Padding(
      padding: EdgeInsets.all(paddingValue),
      child: Container(
        color: AppColors.card,
        width: isSpecial ? screenWidth * 0.086 * 1.5 : screenWidth * 0.086,
        height: screenHeight * 0.06,
        child: Center(
          child: (label == "ENTER" || label == "BACKSPACE")
          ?Icon(
            label == "BACKSPACE" ? Icons.backspace_outlined : Icons.subdirectory_arrow_left_outlined,
            color: AppColors.text,
            size: screenHeight * 0.03,
          )
          :Text(
            label == "BACKSPACE" ? '' : label,
            style: AppTypography.wordStyle.copyWith(
              fontSize: screenHeight * 0.03,
            ),
          ),
        ),
      ),
    );
  }
}