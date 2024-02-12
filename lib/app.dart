import 'package:flutter/material.dart';
import 'package:slide_stack/pages/game/game.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameWidget(),
    );
  }
}