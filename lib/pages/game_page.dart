import 'package:flutter/material.dart';
import 'package:wordle_app/components/game_appbar.dart';
import 'package:wordle_app/components/game_drawer.dart';
import 'package:wordle_app/themes/themes.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawerScrimColor: Colors.black.withValues(alpha: 0.5),
      // AppBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.08,
        ),
        child: GameAppBar(),
      ),
      // Drawer
      drawer: GameDrawer(),
    );
  }
}