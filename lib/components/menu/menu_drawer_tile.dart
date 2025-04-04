import 'package:flutter/material.dart';
import 'package:wordle_app/themes/themes.dart';

class MenuDrawerTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const MenuDrawerTile(
      {super.key,
      required this.text,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: AppTypography.wordStyle.copyWith(
          fontSize: MediaQuery.of(context).size.height * 0.03,
        ),
      ),
      leading: Icon(icon),
      textColor: AppColors.text,
      iconColor: AppColors.secondary,
      onTap: onTap,
    );
  }
}
