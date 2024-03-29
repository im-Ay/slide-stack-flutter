import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slide_stack/gamelogic/game_logic.dart';

import 'package:slide_stack/gamelogic/map/map.dart';
import 'package:slide_stack/gamelogic/shape/active_shape.dart';
import 'package:slide_stack/pages/game/grid/block.dart';

class GameGridWidget extends ConsumerWidget {
  const GameGridWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameMap = ref.watch(gameMapProvider);

    return GestureDetector(
      onTapDown: (details) {
        if (ref.read(activeShapeProvider) != null) {
          ref.read(gameLogicProvider.notifier).onGridTapDown();
        }
      },
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gameMap.columnCount),
        itemCount: gameMap.blockCount,
        physics: const NeverScrollableScrollPhysics(),
        reverse: true,
        controller: ScrollController(initialScrollOffset: 10.0),
        itemBuilder: (gridContext, index) {
          int ci = index % gameMap.columnCount;
          int ri = (index / gameMap.columnCount).floor();

          return BlockWidget(
            index: index,
            columnIndex: ci,
            rowIndex: ri,
          );
        },
      ),
    );
  }
}
