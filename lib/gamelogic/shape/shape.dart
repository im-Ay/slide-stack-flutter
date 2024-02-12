import 'package:flutter/foundation.dart';
import 'package:slide_stack/utils/exeptions.dart';

import '../map/block.dart';

@immutable
class Shape {
  Shape({
    required this.blocks,
    int? value,
  }) {
    this.value = value ?? 100;
  }

  final List<Block> blocks;
  late final int value;

  Shape copyWith({
    int? value,
    List<Block>? blocks,
  }) {
    return Shape(
      blocks: blocks ?? this.blocks,
      value: value ?? this.value,
    );
  }
}

@immutable
class DynamicShape extends Shape {
  DynamicShape({
    required super.blocks,
    this.direction = 1,
    this.moveInterval = 16,
    super.value,
  });

  final int direction;
  final int moveInterval;

  @override
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
      if (block.columnIndex < 0 || block.columnIndex > lastColumnIndex) {
        outOfMapBlockCount++;
        break;
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

@immutable
class LineShape extends DynamicShape {
  LineShape({
    final int length = 3,
    List<Block>? blocks,
    super.value,
    super.direction,
    super.moveInterval,
  }) : super(
          blocks: (blocks != null)
              ? List.from(blocks, growable: false)
              : List.generate(
                  length,
                  (index) => ShapeBlock(
                    columnIndex: index,
                    rowIndex: 0,
                  ),
                ),
        );

  @override
  LineShape copyWith({
    int? length,
    int? value,
    int? direction,
    int? moveInterval,
    List<Block>? blocks,
  }) {
    return LineShape(
      length: blocks?.length ?? (length ?? this.blocks.length),
      direction: direction ?? this.direction,
      moveInterval: moveInterval ?? this.moveInterval,
      value: value ?? this.value,
      blocks: blocks,
    );
  }
}
