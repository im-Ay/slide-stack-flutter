import 'package:flutter/material.dart';

class BlockWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        color: Colors.black45,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('$columnIndex'),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text('$rowIndex'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('$index'),
            ),
          ],
        ),
      ),
    );
  }
}
