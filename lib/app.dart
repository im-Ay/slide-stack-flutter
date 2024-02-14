import 'package:flutter/material.dart';
import 'package:slide_stack/pages/game/game.dart';
import 'package:slide_stack/pages/home/home.dart';
import 'package:slide_stack/pages/maps/maps.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Pixelify'),
      routes: {
        '/': (context) => const HomePage(),
        '/maps': (context) => const MapsPage(),
        '/game': (context) => const GamePage(),
      },
    );
  }
}
