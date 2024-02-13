import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:slide_stack/gamelogic/game_score.dart';
import 'package:slide_stack/gamelogic/game_state.dart';

import 'package:slide_stack/gamelogic/game_tick.dart';
import 'package:slide_stack/gamelogic/map/map.dart';
import 'package:slide_stack/gamelogic/map/map_blocks.dart';
import 'package:slide_stack/gamelogic/shape/active_shape.dart';
import 'package:slide_stack/models/gamestate.dart';
import 'package:slide_stack/utils/exeptions.dart';

part 'game_logic.g.dart';

@riverpod
class GameLogic extends _$GameLogic {
  @override
  Object? build() {
    ref.listen(gameTickStateProvider, (previous, next) {});
    ref.listen(gameTickProvider, (previous, next) {});
    ref.listen(gameMapProvider, (previous, next) {});
    ref.listen(gameScoreProvider, (previous, next) {
      print("SCORE: $next");
    });

    ref.listen(gameStateProvider, (previous, next) {
      print(next);
      switch (next) {
        case GameStates.start:
          ref.read(gameMapProvider.notifier).activateNextShape();
          ref.read(gameTickProvider.notifier).start();
          break;
        case GameStates.lose:
          ref.read(gameTickProvider.notifier).cancel();
          ref.read(activeShapeProvider.notifier).clearShape();
          print("LOSE");
          break;
        case GameStates.wone:
          ref.read(gameTickProvider.notifier).cancel();
          ref.read(activeShapeProvider.notifier).clearShape();
          print("WONE");
          break;
        default:
      }
    });

    ref.listen(
      activeShapeProvider,
      (previous, next) {
        final gameState = ref.read(gameStateProvider.notifier);
        if (gameState.state == GameStates.start) {
          gameState.setState(GameStates.running);
        }
      },
    );

    return null;
  }

  onStartPlaying() {
    ref.read(gameStateProvider.notifier).setState(GameStates.start);
  }

  onGridTapDown() {
    try {
      if (ref.read(mapBlocksProvider.notifier).stackShape()) {
        ref.read(gameMapProvider.notifier).activateNextShape();
      } else {
        ref.read(gameStateProvider.notifier).setState(GameStates.lose);
      }
    } on MissingActiveShapeException {
      if (kDebugMode) {
        print("ERROR: Missing ActiveShape when tap - Not supposed to happen");
      }
    }
  }
}
