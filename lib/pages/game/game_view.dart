import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slide_stack/gamelogic/game_logic.dart';

import 'package:slide_stack/gamelogic/game_tick.dart';
import 'package:slide_stack/pages/game/game_score.dart';
import 'package:slide_stack/pages/game/grid/grid.dart';
import 'package:slide_stack/widgets/bottom_bar.dart';

class GameViewWidget extends ConsumerWidget {
  const GameViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickState = ref.watch(gameTickStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const GameScoreWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: GameGridWidget(),
            ),
            (kDebugMode)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: tickState == GameTickStates.inActive
                            ? () {
                                ref
                                    .read(gameLogicProvider.notifier)
                                    .onStartPlaying();
                              }
                            : null,
                        child: const Text("Start"),
                      ),
                      IconButton.filled(
                        icon: const Icon(Icons.stop),
                        onPressed: tickState == GameTickStates.active ||
                                tickState == GameTickStates.paused
                            ? () {
                                ref.read(gameTickProvider.notifier).cancel();
                              }
                            : null,
                      ),
                      IconButton.filled(
                        icon: const Icon(Icons.pause),
                        onPressed: tickState == GameTickStates.active
                            ? () {
                                ref.read(gameTickProvider.notifier).pause();
                              }
                            : null,
                      ),
                      ElevatedButton(
                        onPressed: tickState == GameTickStates.paused
                            ? () {
                                ref.read(gameTickProvider.notifier).resume();
                              }
                            : null,
                        child: const Text("Resume"),
                      ),
                    ],
                  )
                : const SizedBox(),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
