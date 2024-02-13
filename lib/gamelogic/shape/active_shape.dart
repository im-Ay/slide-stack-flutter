import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:slide_stack/gamelogic/game_tick.dart';
import 'package:slide_stack/gamelogic/map/map_blocks.dart';
import 'package:slide_stack/gamelogic/shape/dynamic_shape.dart';
import 'package:slide_stack/utils/exeptions.dart';

part 'active_shape.g.dart';

@riverpod
class ActiveShape extends _$ActiveShape {
  @override
  DynamicShape? build() {
    ref.listen(gameTickProvider, (previous, next) => _move(next));
    return null;
  }

  setShape(DynamicShape newShape) {
    if (kDebugMode) {
      print("New Shape ${newShape.blocks.toString()}");
    }
    state = newShape;
  }

  clearShape() {
    state = null;
    if (kDebugMode) {
      print("ClearShape: $state");
    }
  }

  _move(int tick) {
    if (state == null) return;

    final mapBlock = ref.read(mapBlocksProvider);

    try {
      state = state!.move(tick, mapBlock);
    } on NotMyTickException {
      // Shape don't move in this Tick
    } on HitWallException {
      try {
        state = state!.moveReverse(tick, mapBlock);
      } on NotMyTickException {
        // Shape don't move in this Tick
      } on HitWallException {
        // ERROR: Not supposed to happen
      }
    }
  }
}
