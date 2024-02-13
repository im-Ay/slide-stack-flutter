import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:slide_stack/gamelogic/game_score.dart';
import 'package:slide_stack/gamelogic/shape/active_shape.dart';
import 'package:slide_stack/utils/exeptions.dart';

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
      (ri) => List.generate(
        gameMap.columnCount,
        (ci) {
          var dataIndex = gameMap.predefinedBlocks.indexWhere(
              (block) => block.columnIndex == ci && block.rowIndex == ri);

          if (dataIndex == -1) {
            return Block(columnIndex: ci, rowIndex: ri);
          } else {
            return Block.fromBlock(
                gameMap.predefinedBlocks.elementAt(dataIndex));
          }
        },
        growable: false,
      ),
      growable: false,
    );
  }

  bool stackShape() {
    var shape = ref.read(activeShapeProvider);
    if (shape == null) {
      throw MissingActiveShapeException;
    }

    bool isSuccess = false;
    final newState = state.map((row) {
      return row.map((block) {
        var shapeIndex = shape.blocks.indexWhere((shapeBlock) =>
            shapeBlock.rowIndex == block.rowIndex &&
            shapeBlock.columnIndex == block.columnIndex &&
            (shapeBlock.rowIndex == 0 ||
                state[shapeBlock.rowIndex - 1][shapeBlock.columnIndex].state ==
                    BlockState.on));

        if (shapeIndex != -1) {
          isSuccess = true;
          return Block.fromBlock(shape.blocks.elementAt(shapeIndex));
        }

        return block;
      }).toList(growable: false);
    }).toList(growable: false);

    if (isSuccess) {
      ref.read(gameScoreProvider.notifier).add(shape.value);
      state = newState;
    }

    return isSuccess;
  }
}
