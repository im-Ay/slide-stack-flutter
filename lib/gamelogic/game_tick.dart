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

  bool isActive() => _timer == null ? false : _timer!.isActive;

  start() {
    cancel(false);
    resume(false);
    ref.read(gameTickStateProvider.notifier).start();
  }

  cancel([bool notifyTickState = true]) {
    _startCount = 0;
    _timer?.cancel();
    _timer = null;
    if (notifyTickState) {
      ref.read(gameTickStateProvider.notifier).cancel();
    }
  }

  pause([bool notifyTickState = true]) {
    if (_timer == null) throw "Timer is Empty";
    _startCount = _timer!.tick;
    _timer!.cancel();
    _timer = null;
    if (notifyTickState) {
      ref.read(gameTickStateProvider.notifier).paused();
    }
  }

  resume([bool notifyTickState = true]) {
    if (_timer != null && _timer!.isActive) throw "Timer is Active";
    _timer = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        state = state + 1;
      },
    );
    state = _startCount;
    if (notifyTickState) {
      ref.read(gameTickStateProvider.notifier).resume();
    }
  }
}

enum GameTickStates {
  active,
  inActive,
  paused,
}

@riverpod
class GameTickState extends _$GameTickState {
  @override
  GameTickStates build() {
    return GameTickStates.inActive;
  }

  setState(GameTickStates newState) {
    state = newState;
  }

  start() {
    state = GameTickStates.active;
  }

  cancel() {
    state = GameTickStates.inActive;
  }

  paused() {
    state = GameTickStates.paused;
  }

  resume() {
    state = GameTickStates.active;
  }

  bool isActive() => state == GameTickStates.active;
}
