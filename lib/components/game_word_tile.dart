import 'package:flutter/material.dart';
import 'package:wordle_app/themes/themes.dart';

class GameWordTile extends StatelessWidget {
  const GameWordTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final paddingValue = (screenWidth < screenHeight ? screenWidth : screenHeight) * 0.006;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingValue, 
        vertical: paddingValue,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(
            width: 2,
            color: AppColors.surface,
          ),
        ),
      ),
    );
  }
}