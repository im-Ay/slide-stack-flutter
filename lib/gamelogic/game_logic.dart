import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:slide_stack/gamelogic/game_tick.dart';
import 'package:slide_stack/gamelogic/map/map.dart';
import 'package:slide_stack/gamelogic/map/map_blocks.dart';
import 'package:slide_stack/gamelogic/shape/active_shape.dart';
import 'package:slide_stack/utils/exeptions.dart';

part 'game_logic.g.dart';

@riverpod
class GameLogic extends _$GameLogic {
  @override
  Object? build() {
    ref.watch(gameTickStateProvider);
    ref.watch(gameTickProvider);
    ref.watch(gameMapProvider);

    ref.listen(
      activeShapeProvider,
      (previous, next) {
        if (next == null) {
          return;
        }
        final gameTick = ref.read(gameTickProvider.notifier);
        if (!gameTick.isActive()) {
          gameTick.start();
        }
      },
    );

    return null;
  }

  onStartPlaying() {
    if (ref.read(gameMapProvider.notifier).activateNextShape()) {
      print("SUCCESS: Game Started!");
    } else {
      ref.read(gameTickProvider.notifier).cancel();
      print("ERROR: No starting Shape!?");
    }
  }

  onGridTapDown() {
    try {
      if (ref.read(mapBlocksProvider.notifier).stackShape()) {
        if (!ref.read(gameMapProvider.notifier).activateNextShape()) {
          ref.read(gameTickProvider.notifier).cancel();
        }
      } else {
        ref.read(gameTickProvider.notifier).cancel();
      }
    } on MissingActiveShapeException {
      if (kDebugMode) {
        print("ERROR: Missing ActiveShape when tap - Not supposed to happen");
      }
    }
  }
}
