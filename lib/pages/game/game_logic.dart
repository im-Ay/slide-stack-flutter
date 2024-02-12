import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slide_stack/gamelogic/game_logic.dart';

class GameLogicWidget extends ConsumerWidget {
  const GameLogicWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameLogicProvider);

    return child;
  }
}
