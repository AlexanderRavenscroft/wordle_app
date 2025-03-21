import 'package:flutter/material.dart';
import 'package:wordle_app/themes/themes.dart';

class MenuMessageDialog extends StatelessWidget {
  final String headingText;
  final String contentText;
  const MenuMessageDialog({super.key, required this.headingText, required this.contentText});

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
            color: AppColors.secondary,
            size: MediaQuery.of(context).size.height * 0.04,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Text(
            headingText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: MediaQuery.of(context).size.height * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      // Content
      content: Text(
        contentText,
        textAlign: TextAlign.center,
        softWrap: true,
        style: TextStyle(
          color: AppColors.text,
          fontSize: MediaQuery.of(context).size.height * 0.024,
        ),
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
            'OK',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.text,
              fontSize: MediaQuery.of(context).size.height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
