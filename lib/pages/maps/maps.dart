import 'package:flutter/material.dart';
import 'package:slide_stack/widgets/bottom_bar.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text("Map 1"),
                    onTap: () => Navigator.pushNamed(context, "/game"),
                  ),
                  ListTile(title: Text("Map 2")),
                  ListTile(title: Text("Map 3")),
                ],
              ),
            ),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
