import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:slide_stack/gamelogic/shape/active_shape.dart';
import 'package:slide_stack/gamelogic/shape/shape_factory.dart';
import 'package:slide_stack/models/shape.dart';

import 'block.dart';

part 'map.g.dart';

@riverpod
class GameMap extends _$GameMap {
  @override
  MapData build() {
    // return MapData(shapes: List.empty());
    return MapData(shapes: [
      const LineShapeData(data: 1, rowPosition: 0, columnPosition: 10),
      const LineShapeData(
          data: 2, rowPosition: 1, columnPosition: 10, value: 100),
      const LineShapeData(
          data: 3,
          rowPosition: 2,
          columnPosition: -3,
          direction: 1,
          moveInterval: 10),
    ]);
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

  void activateNextShape() {
    if (state.shapes.isEmpty) {
      ref.read(activeShapeProvider.notifier).clearShape();
      return;
    }
    ref
        .read(activeShapeProvider.notifier)
        .setShape(ShapeFactory.create(state.shapes.removeAt(0)));
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
  final List<ShapeData> shapes;
  late final int blockCount;
  late final List<Block> predefinedBlocks;
}
