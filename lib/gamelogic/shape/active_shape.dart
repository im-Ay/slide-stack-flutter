import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:slide_stack/gamelogic/shape/shape.dart';

part 'active_shape.g.dart';

@riverpod
class ActiveShape extends _$ActiveShape {
  @override
  Shape? build() {
    return null;
  }

  setShape(Shape newShape) {
    if (kDebugMode) {
      print("New Shape ${newShape.blocks.toString()}");
    }
    state = newShape;
  }

  clearShape() {
    state = null;
  }
}
