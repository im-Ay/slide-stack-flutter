import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:slide_stack/gamelogic/shape/active_shape.dart';
import 'package:slide_stack/gamelogic/shape/shape.dart';

import 'block.dart';

part 'map.g.dart';

@riverpod
class GameMap extends _$GameMap {
  @override
  MapData build() {
    // return MapData(shapes: List.empty());
    return MapData(shapes: [LineShape(length: 1), LineShape()]);
  }

  void setMap(String mapId) {
    switch (mapId) {
      case 'map001':
        state = MapData(rowCount: 10, shapes: []);
        break;
      case 'map002':
        state = MapData(rowCount: 17, columnCount: 8, shapes: []);
        break;
      default:
        state = MapData(shapes: []);
        break;
    }
  }

  bool activateNextShape() {
    if (state.shapes.isEmpty) {
      return false;
    }
    ref.read(activeShapeProvider.notifier).setShape(state.shapes.removeAt(0));
    return true;
  }
}

class MapData {
  MapData({
    required this.shapes,
    this.rowCount = 17,
    this.columnCount = 10,
    List<Block>? predefinedBlocks,
  }) {
    this.predefinedBlocks = predefinedBlocks ?? [];

    blockCount = rowCount * columnCount;
  }

  final int rowCount;
  final int columnCount;
  final List<DynamicShape> shapes;
  late final int blockCount;
  late final List<Block> predefinedBlocks;
}
