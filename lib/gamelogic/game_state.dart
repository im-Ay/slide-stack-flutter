import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:slide_stack/models/gamestate.dart';

part 'game_state.g.dart';

@riverpod
class GameState extends _$GameState {
  @override
  GameStates build() {
    return GameStates.initialize;
  }

  setState(GameStates newState) {
    state = newState;
  }
}
