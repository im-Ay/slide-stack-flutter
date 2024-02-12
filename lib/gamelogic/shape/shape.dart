import 'package:flutter/foundation.dart';

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
}

@immutable
class LineShape extends Shape {
  LineShape({final int length = 3, super.value})
      : super(
          blocks: List.generate(
            length,
            (index) => ShapeBlock(
              columnIndex: index,
              rowIndex: 0,
            ),
          ),
        );
}
