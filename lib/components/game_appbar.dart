import 'package:flutter/material.dart';
import 'package:wordle_app/components/appbar_button.dart';
import 'package:wordle_app/services/word_service.dart';
import 'package:wordle_app/themes/themes.dart';

class GameAppBar extends StatelessWidget {
  const GameAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surface,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true, 
      // Title  
      title: Text(
        'WORDLE', 
        style: AppTypography.wordStyle.copyWith(
          fontSize: MediaQuery.of(context).size.height * 0.04,
          color: AppColors.secondary,
        )
      ),

      // Drawer
      leading: AppbarButton(
          icon: Icons.menu,
          onPressed: () => Scaffold.of(context).openDrawer(),
        ), 

      // Actions
      actions: [
        AppbarButton(
          icon: Icons.lightbulb,
          onPressed: () {},
        ),
        AppbarButton(
          icon: Icons.refresh,
          onPressed: () async {
            var guessedWord = await WordService.fetchWord();
            debugPrint(guessedWord);
          }
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
      ],
    );
  }
}