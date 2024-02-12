import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_tick.g.dart';

@riverpod
class GameTick extends _$GameTick {
  Timer? _timer;
  int _startCount = 0;

  @override
  int build() {
    return -1;
  }

  start() {
    cancel();
    resume();
  }

  cancel() {
    _startCount = 0;
    _timer?.cancel();
    _timer = null;
  }

  pause() {
    if (_timer == null) throw "Timer is Empty";
    _startCount = _timer!.tick;
    _timer!.cancel();
    _timer = null;
  }

  resume() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 1000),
      (timer) {
        state = state + 1;
      },
    );
    state = _startCount;
  }
}
