import 'package:flutter/material.dart';
import 'package:wordle_app/components/game_drawer_tile.dart';
import 'package:wordle_app/themes/themes.dart';

class GameDrawer extends StatelessWidget {
  const GameDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          // Header
          DrawerHeader(
            child: Center(
              child: Text(
                'WORDLE', 
                style: AppTypography.wordStyle.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  color: AppColors.secondary,
                )
              ),
            ),
          ),

          // Home
          GameDrawerTile(
            text: 'Home',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // New Game
          GameDrawerTile(
            text: 'New Game',
            icon: Icons.refresh,
            onTap: () => Navigator.pop(context),  // TODO: Reset game
           
          ),

          // Instructions
          GameDrawerTile(
            text: 'How to play',
            icon: Icons.lightbulb,
            onTap: () => Navigator.pop(context), // TODO: Display instructions
          ),

          // Creator Info
          GameDrawerTile(
            text: 'About Creator',
            icon: Icons.kebab_dining,
            onTap: () => Navigator.pop(context) //TODO: Display creator info  
          ),
        ],
      ),
    );
  }
}