import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:slide_stack/gamelogic/map/map.dart';
import 'package:slide_stack/gamelogic/shape/active_shape.dart';
import 'package:slide_stack/gamelogic/shape/shape.dart';
import 'package:slide_stack/pages/game/grid/grid.dart';

class GameWidget extends ConsumerWidget {
  const GameWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameMapProvider);

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
            ElevatedButton(
              onPressed: () =>
                  ref.read(activeShapeProvider.notifier).setShape(LineShape()),
              child: const Text("Test"),
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
