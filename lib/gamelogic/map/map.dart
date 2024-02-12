import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'block.dart';

part 'map.g.dart';

@riverpod
class GameMap extends _$GameMap {
  @override
  MapData build() {
    return MapData();
  }

  void setMap(String mapId) {
    switch (mapId) {
      case 'map001':
        state = MapData(rowCount: 10);
        break;
      case 'map002':
        state = MapData(rowCount: 17, columnCount: 8);
        break;
      default:
        state = MapData();
        break;
    }
  }
}

class MapData {
  MapData({
    this.rowCount = 17,
    this.columnCount = 10,
    List<Block>? predefinedBlocks,
  }) {
    this.predefinedBlocks = predefinedBlocks ?? [];

    blockCount = rowCount * columnCount;
  }

  final int rowCount;
  final int columnCount;
  late final int blockCount;
  late final List<Block> predefinedBlocks;
}
