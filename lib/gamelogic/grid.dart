import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:slide_stack/gamelogic/map/map_blocks.dart';
import 'package:slide_stack/gamelogic/shape/active_shape.dart';

import 'map/block.dart';

part 'grid.g.dart';

@riverpod
List<List<Block>> gridBlocks(GridBlocksRef ref) {
  final mapBlocks = ref.watch(mapBlocksProvider);
  final activeShape = ref.watch(activeShapeProvider);

  return mapBlocks
      .map((row) => row.map((block) {
            var shapeIndex = activeShape?.blocks.indexWhere(
                  (sBlock) => sBlock.isCoordinateMatch(
                    rowIndex: block.rowIndex,
                    columnIndex: block.columnIndex,
                  ),
                ) ??
                -1;
            if (shapeIndex == -1) {
              return block;
            } else {
              var shapeBlock = activeShape!.blocks.elementAt(shapeIndex);
              return block.copyWith(state: shapeBlock.state);
            }
          }).toList(growable: false))
      .toList(growable: false);
}
