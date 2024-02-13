import 'package:flutter/foundation.dart';
import 'package:slide_stack/gamelogic/map/block.dart';
import 'package:slide_stack/gamelogic/shape/dynamic_shape.dart';

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
              : LineShape.generateBlocks(length: length),
        );

  static generateBlocks(
      {required int length, int columnPosition = 0, int rowPosition = 0}) {
    return List.generate(
      length,
      (index) => ShapeBlock(
        columnIndex: index + columnPosition,
        rowIndex: rowPosition,
      ),
    );
  }

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
