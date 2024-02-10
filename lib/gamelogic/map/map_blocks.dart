import 'package:riverpod_annotation/riverpod_annotation.dart';

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
        return Block(
          columnIndex: ci,
          rowIndex: ri,
          data: dataIndex == -1
              ? null
              : gameMap.predefinedBlocks.elementAt(dataIndex),
        );
      }, growable: false),
      growable: false,
    );
  }
}
