import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordle_app/pages/game_page.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized(); 

  // Set the preferred orientations to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Run app
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordle App',
      home: const GamePage(), 
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling, // Disable system font scaling
          ),
          child: child!,
        );
      },
    );
  }
}