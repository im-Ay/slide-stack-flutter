import 'package:flutter/material.dart';

import 'game_logic.dart';
import 'game_view.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const GameLogicWidget(
      child: GameViewWidget(),
    );
  }
}
