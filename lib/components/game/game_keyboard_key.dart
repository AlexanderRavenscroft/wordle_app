import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle_app/services/word_service_provider.dart';
import 'package:wordle_app/themes/themes.dart';

class GameKeyboardKey extends StatelessWidget {
  final String label;
  final Color keyColor;
  const GameKeyboardKey({super.key, required this.label, this.keyColor = AppColors.card});

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
            Provider.of<WordService>(context, listen: false).checkWord(context);
          } else if (label == "BACKSPACE") {
            Provider.of<WordService>(context, listen: false).removeLetter();
          } else {
            Provider.of<WordService>(context, listen: false).typeLetter(label);
          }    
        },
        child: Container(        
          width: isSpecial ? screenWidth * 0.082 * 1.5 : screenWidth * 0.082,
          height: screenHeight * 0.06,
          decoration: BoxDecoration(
            color: keyColor,
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