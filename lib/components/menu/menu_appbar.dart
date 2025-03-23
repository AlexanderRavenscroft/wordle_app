import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle_app/components/menu/menu_appbar_button.dart';
import 'package:wordle_app/services/word_service.dart';
import 'package:wordle_app/themes/themes.dart';

class MenuAppBar extends StatelessWidget {
  const MenuAppBar({super.key});

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
      leading: MenuAppBarButton(
          icon: Icons.menu,
          onPressed: () => Scaffold.of(context).openDrawer(),
        ), 

      // Actions
      actions: [
        MenuAppBarButton(
          icon: Icons.lightbulb,
          onPressed: () {},
        ),
        MenuAppBarButton(
          icon: Icons.refresh,
          onPressed: () => Provider.of<WordService>(context, listen: false).resetGame(),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
      ],
    );
  }
}