import 'package:flutter/material.dart';
import 'package:wordle_app/components/game_appbar.dart';
import 'package:wordle_app/components/game_drawer.dart';
import 'package:wordle_app/components/game_word_grid.dart';
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

      // Body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ 
            // Container(
            //   color: AppColors.surface,
            //   width: MediaQuery.of(context).size.width * 0.75,
            //   height: MediaQuery.of(context).size.height * 0.42,  
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              child: GameWordGrid(),  
            ),
            Container(
                color: AppColors.card,
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.height * 0.24,
            ),
          ],
        ),
      ),
    );
  }
}