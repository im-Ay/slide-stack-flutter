import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slide_stack/gamelogic/grid.dart';

class BlockWidget extends ConsumerWidget {
  const BlockWidget({
    super.key,
    required this.index,
    required this.columnIndex,
    required this.rowIndex,
  });

  final int index;
  final int columnIndex;
  final int rowIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final block = ref.watch(gridBlocksProvider.select(
      (blocks) => blocks[rowIndex][columnIndex],
    ));

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        color: block.getColor(context),
        child: false
            ? Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('$columnIndex',
                        style: const TextStyle(fontSize: 12.0)),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text('$rowIndex',
                        style: const TextStyle(fontSize: 12.0)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        Text('$index', style: const TextStyle(fontSize: 12.0)),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
