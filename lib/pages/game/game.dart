import 'package:flutter/material.dart';
import 'package:slide_stack/pages/game/grid/grid.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: 14.0, right: 14.0, bottom: 32.0, top: 64.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GameGridWidget(),
            ),
            Text(
              "Made by imAy",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
