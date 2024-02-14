import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Made by imAy",
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
