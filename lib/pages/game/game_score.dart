import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slide_stack/gamelogic/game_score.dart';

class GameScoreWidget extends ConsumerWidget {
  const GameScoreWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameScore = ref.watch(gameScoreProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$gameScore",
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
