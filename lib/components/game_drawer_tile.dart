import 'package:flutter/material.dart';
import 'package:wordle_app/themes/themes.dart';

class GameDrawerTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const GameDrawerTile(
      {super.key,
      required this.text,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.04,
      ),
      title: Text(
        text,
        style: AppTypography.wordStyle.copyWith(
          fontSize: MediaQuery.of(context).size.height * 0.03,
        )
      ),
      leading: Icon(icon),
      textColor: AppColors.text,
      iconColor: AppColors.text,
      onTap: onTap,
    );
  }
}
