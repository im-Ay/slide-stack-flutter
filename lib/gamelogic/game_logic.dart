import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:slide_stack/gamelogic/game_tick.dart';
import 'package:slide_stack/gamelogic/map/map.dart';
import 'package:slide_stack/gamelogic/shape/active_shape.dart';

part 'game_logic.g.dart';

@riverpod
class GameLogic extends _$GameLogic {
  @override
  Object? build() {
    ref.watch(gameTickProvider);
    ref.watch(gameMapProvider);
    ref.watch(activeShapeProvider);

    return null;
  }
}
