import 'package:flutter/material.dart';
import 'package:slide_stack/pages/game/grid/block.dart';

class GameGridWidget extends StatelessWidget {
  const GameGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
        itemCount: 170,
        physics: const NeverScrollableScrollPhysics(),
        reverse: true,
        controller: ScrollController(initialScrollOffset: 10.0),
        itemBuilder: (a, index) => BlockWidget(),
      ),
    );
  }
}
