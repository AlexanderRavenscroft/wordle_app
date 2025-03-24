import 'package:flutter/material.dart';
import 'package:wordle_app/themes/themes.dart';

class MenuGuideDialog extends StatelessWidget {
  const MenuGuideDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      // Title
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info,
            color: AppColors.primary,
            size: MediaQuery.of(context).size.height * 0.04,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Text(
            'How to Play',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: MediaQuery.of(context).size.height * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      // Content
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '''Guess the Wordle in 6 tries.
- Each guess must be a valid 5-letter word.
- The color of the tiles will change to show how close your guess was to the word.''',
            textAlign: TextAlign.start,
            softWrap: true,
            style: TextStyle(
              color: AppColors.text,
              fontSize: MediaQuery.of(context).size.height * 0.024,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            'Examples',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.text,
              fontSize: MediaQuery.of(context).size.height * 0.024,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset('assets/images/game_guide_one.png'),
          Text(
            '"W" is in the word and in the correct spot.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: AppColors.text,
              fontSize: MediaQuery.of(context).size.height * 0.024,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Image.asset('assets/images/game_guide_two.png'),
          Text(
            '"I" is in the word but in the wrong spot',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: AppColors.text,
              fontSize: MediaQuery.of(context).size.height * 0.024,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Image.asset('assets/images/game_guide_three.png'),
          Text(
            'None of above letters are in the word',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: AppColors.text,
              fontSize: MediaQuery.of(context).size.height * 0.024,
            ),
          ),
        ],
      ),

      // Actions
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(AppColors.card),
            minimumSize: WidgetStateProperty.all(
              Size(MediaQuery.of(context).size.width * 0.5,
                  MediaQuery.of(context).size.height * 0.06),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'SURE!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.text,
              fontSize: MediaQuery.of(context).size.height * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}