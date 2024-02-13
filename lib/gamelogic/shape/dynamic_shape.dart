import 'package:flutter/foundation.dart';
import 'package:slide_stack/models/shape.dart';
import 'package:slide_stack/utils/exeptions.dart';

import '../map/block.dart';

@immutable
class DynamicShape extends Shape {
  DynamicShape({
    required super.blocks,
    int? direction,
    int? moveInterval,
    int? value,
  }) {
    this.direction = direction ?? -1;
    this.moveInterval = moveInterval ?? 16;
    this.value = value ?? 50;
  }
  late final int direction;
  late final int moveInterval;
  late final int value;

  DynamicShape copyWith({
    int? value,
    int? direction,
    int? moveInterval,
    List<Block>? blocks,
  }) {
    return DynamicShape(
      direction: direction ?? this.direction,
      moveInterval: moveInterval ?? this.moveInterval,
      value: value ?? this.value,
      blocks: blocks ?? this.blocks,
    );
  }

  T move<T extends DynamicShape>(
    int tick,
    List<List<Block>> mapBlocks, {
    bool hitWalls = true,
    bool reverse = false,
  }) {
    if ((tick % moveInterval) != 0) {
      throw NotMyTickException();
    }
    List<Block> newBlocks = blocks
        .map((block) => block.copyWith(
            columnIndex: block.columnIndex + direction * (reverse ? -1 : 1)))
        .toList();

    final int lastColumnIndex = mapBlocks[0].length - 1;
    var outOfMapBlockCount = 0;
    for (var block in newBlocks) {
      if (direction < 0) {
        if (block.columnIndex < 0) {
          outOfMapBlockCount++;
          break;
        }
      } else if (direction > 0) {
        if (block.columnIndex > lastColumnIndex) {
          outOfMapBlockCount++;
          break;
        }
      }
    }

    if (outOfMapBlockCount != 0) {
      if (hitWalls) {
        throw HitWallException();
      }
    }

    return copyWith(
        blocks: newBlocks,
        value: value,
        direction: reverse ? -direction : direction) as T;
  }

  T moveReverse<T extends DynamicShape>(
    int tick,
    List<List<Block>> mapBlocks, {
    bool hitWalls = true,
  }) {
    try {
      return move(tick, mapBlocks, hitWalls: hitWalls, reverse: true);
    } catch (e) {
      rethrow;
    }
  }
}
