import 'package:flutter/material.dart';
import 'package:slide_stack/pages/game/game.dart';
import 'package:slide_stack/pages/home/home.dart';
import 'package:slide_stack/pages/maps/maps.dart';
import 'package:slide_stack/utils/themes/base_color_schemes.dart';
import 'package:slide_stack/utils/themes/base_text_themes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          fontFamily: 'Pixelify',
          textTheme: pixelifyTextTheme),
      routes: {
        '/': (context) => const HomePage(),
        '/maps': (context) => const MapsPage(),
        '/game': (context) => const GamePage(),
      },
    );
  }
}
