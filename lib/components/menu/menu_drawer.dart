import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle_app/components/menu/menu_drawer_tile.dart';
import 'package:wordle_app/components/menu/menu_guide_dialog.dart';
import 'package:wordle_app/components/menu/menu_message_dialog.dart';
import 'package:wordle_app/services/word_service_provider.dart';
import 'package:wordle_app/themes/themes.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

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
          MenuDrawerTile(
            text: 'Home',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // New Game
          MenuDrawerTile(
            text: 'New Game',
            icon: Icons.refresh,
            onTap: () {
              Provider.of<WordService>(context, listen: false).resetGame();
              Navigator.pop(context);
            } 
          ),

          // Instructions
          MenuDrawerTile(
            text: 'How to play',
            icon: Icons.lightbulb,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => MenuGuideDialog(),
              );
            }
          ),

          // Creator Info
          MenuDrawerTile(
            text: 'About Creator',
            icon: Icons.kebab_dining,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => MenuMessageDialog(
                  headingColor: AppColors.secondary,
                  headingText: 'About Me',
                  contentText: "Hi! I am Alexander Ravenscroft, a passionate Flutter mobile app developer from Poland.\nI am 19 years old and have been programming for over three years. While I’m still at the beginning of my journey in mobile app development, I love building elegant, cross-platform applications that provide seamless user experiences. I enjoy taking on new challenges and turning ideas into functional apps.\nWhen I’m not coding, you’ll probably find me exploring UI/UX design trends, hitting the gym or sailing.\nLet’s connect and create something amazing together!!",
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}