import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:slide_stack/gamelogic/game_tick.dart';
import 'package:slide_stack/gamelogic/shape/active_shape.dart';
import 'package:slide_stack/gamelogic/shape/shape.dart';
import 'package:slide_stack/pages/game/grid/grid.dart';

class GameViewWidget extends ConsumerWidget {
  const GameViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: 14.0, right: 14.0, bottom: 32.0, top: 64.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: GameGridWidget(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(activeShapeProvider.notifier)
                        .setShape(LineShape());
                    ref.read(gameTickProvider.notifier).start();
                  },
                  child: const Text("Start"),
                ),
                IconButton.filled(
                  icon: const Icon(Icons.stop),
                  onPressed: () {
                    ref.read(gameTickProvider.notifier).cancel();
                  },
                ),
                IconButton.filled(
                  icon: const Icon(Icons.pause),
                  onPressed: () {
                    ref.read(gameTickProvider.notifier).pause();
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(gameTickProvider.notifier).resume();
                  },
                  child: const Text("Resume"),
                ),
              ],
            ),
            const Text(
              "Made by imAy",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
