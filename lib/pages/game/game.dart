import 'package:flutter/material.dart';

import 'game_logic.dart';
import 'game_view.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GameLogicWidget(
      child: GameViewWidget(),
    );
  }
}
