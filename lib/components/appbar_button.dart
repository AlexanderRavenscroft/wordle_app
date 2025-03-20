import 'package:flutter/material.dart';
import 'package:wordle_app/themes/themes.dart';

class AppbarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const AppbarButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(AppColors.text),
        iconSize: WidgetStateProperty.all(MediaQuery.of(context).size.height * 0.04),
      ),
      icon: Icon(
        icon,
      ),
      onPressed: onPressed,
    );
  }
}