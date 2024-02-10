import 'package:flutter/material.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(color: Colors.black45),
    );
  }
}
