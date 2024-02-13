import 'package:slide_stack/gamelogic/map/block.dart';
import 'package:slide_stack/gamelogic/shape/dynamic_shape.dart';
import 'package:slide_stack/gamelogic/shape/line_shape.dart';
import 'package:slide_stack/models/shape.dart';

class ShapeFactory {
  static create(ShapeData source) {
    switch (source.type) {
      case ShapeType.dynamic:
        return DynamicShape(
          blocks: (source as DynamicShapeData)
              .data
              .map(
                (block) => ShapeBlock(
                  columnIndex: block.columnIndex + source.columnPosition,
                  rowIndex: block.rowIndex + source.rowPosition,
                ),
              )
              .toList(growable: false),
          direction: source.direction,
          moveInterval: source.moveInterval,
          value: source.value,
        );

      case ShapeType.line:
        return LineShape(
          blocks: LineShape.generateBlocks(
            length: source.data,
            columnPosition: source.columnPosition,
            rowPosition: source.rowPosition,
          ),
          direction: source.direction,
          moveInterval: source.moveInterval,
          value: source.value,
        );
      default:
        throw 'Error: Not Implemented in ShapeFactory';
    }
  }
}
