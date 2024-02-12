import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:slide_stack/gamelogic/shape/active_shape.dart';

import 'block.dart';
import 'map.dart';

part 'map_blocks.g.dart';

@riverpod
class MapBlocks extends _$MapBlocks {
  @override
  List<List<Block>> build() {
    final gameMap = ref.watch(gameMapProvider);

    return List.generate(
      gameMap.rowCount,
      (ri) => List.generate(gameMap.columnCount, (ci) {
        var dataIndex = gameMap.predefinedBlocks.indexWhere(
            (block) => block.columnIndex == ci && block.rowIndex == ri);

        if (dataIndex == -1) {
          return Block(columnIndex: ci, rowIndex: ri);
        } else {
          return Block.fromBlock(gameMap.predefinedBlocks.elementAt(dataIndex));
        }
      }, growable: false),
      growable: false,
    );
  }

  stackShape() {
    var shape = ref.read(activeShapeProvider);
    if (shape == null) {
      return;
    }

    state = state.map((row) {
      return row.map((block) {
        var shapeIndex = shape.blocks.indexWhere((shapeBlock) =>
            ((shapeBlock.rowIndex == 0 && block.rowIndex == 0) ||
                shapeBlock.rowIndex == block.rowIndex + 1) &&
            shapeBlock.columnIndex == block.columnIndex);

        if (shapeIndex != -1) {
          return Block.fromBlock(shape.blocks.elementAt(shapeIndex));
        }

        return block;
      }).toList(growable: false);
    }).toList(growable: false);
  }
}
