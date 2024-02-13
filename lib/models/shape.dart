import 'package:flutter/foundation.dart';
import 'package:slide_stack/gamelogic/map/block.dart';

enum ShapeType {
  static,
  dynamic,
  line,
}

@immutable
class ShapeData<T> {
  const ShapeData({
    required this.type,
    required this.data,
    required this.columnPosition,
    required this.rowPosition,
    this.direction,
    this.moveInterval,
    this.value,
  });

  final ShapeType type;
  final T data;
  final int columnPosition;
  final int rowPosition;
  final int? direction;
  final int? moveInterval;
  final int? value;
}

@immutable
class StaticShapeData extends ShapeData<List<Block>> {
  const StaticShapeData({
    required super.data,
    required super.columnPosition,
    required super.rowPosition,
  }) : super(type: ShapeType.static);
}

@immutable
class DynamicShapeData extends ShapeData<List<Block>> {
  const DynamicShapeData({
    required super.data,
    required super.columnPosition,
    required super.rowPosition,
    super.direction,
    super.moveInterval,
    super.value,
  }) : super(type: ShapeType.dynamic);
}

@immutable
class LineShapeData extends ShapeData<int> {
  const LineShapeData({
    required super.data,
    required super.columnPosition,
    required super.rowPosition,
    super.direction,
    super.moveInterval,
    super.value,
  }) : super(type: ShapeType.line);
}

@immutable
class Shape {
  const Shape({required this.blocks});

  final List<Block> blocks;
}
