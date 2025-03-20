import 'package:flutter/material.dart';
import 'package:wordle_app/themes/themes.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        elevation: 0,
        centerTitle: true,   
        title: Text(
          'WORDLE', 
          style: AppTypography.wordStyle.copyWith(
            fontSize: MediaQuery.of(context).size.height * 0.04,
            color: AppColors.secondary,
          )
        ),
      ),
    );
  }
}