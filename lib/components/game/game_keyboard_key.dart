import 'package:flutter/material.dart';
import 'package:wordle_app/services/word_service.dart';
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
      child: GestureDetector(
        onTap: () {
          if(label == "ENTER") {
            WordService.checkWord();
          } else if (label == "BACKSPACE") {
            WordService.removeLetter(label);
          } else {
            WordService.typeLetter(label);
          }    
        },
        child: Container(        
          width: isSpecial ? screenWidth * 0.082 * 1.5 : screenWidth * 0.082,
          height: screenHeight * 0.06,
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: (label == "ENTER" || label == "BACKSPACE")
            ?Icon(
              label == "BACKSPACE" ? Icons.backspace_outlined : Icons.subdirectory_arrow_left_outlined,
              color: AppColors.text,
              size: screenHeight * 0.026,
            )
            :Text(
              label,
              style: AppTypography.wordStyle.copyWith(
                fontSize: screenHeight * 0.026,
              ),
            ),
          ),
        ),
      ),
    );
  }
}