import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_score.g.dart';

@riverpod
class GameScore extends _$GameScore {
  @override
  int build() {
    return 0;
  }

  add(int change) {
    state += change;
  }
}
