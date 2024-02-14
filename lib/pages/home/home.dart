import 'package:flutter/material.dart';
import 'package:slide_stack/widgets/bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = TextStyle(
        letterSpacing: 4.0,
        fontFamily: 'Monofett',
        fontSize: 72.0,
        height: 1.0,
        color: Theme.of(context).colorScheme.primary);

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Blocky",
                            style: titleTextStyle,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Text(
                              "Stack",
                              style: titleTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pushNamed(context, "/maps"),
                      child: const Text("PLAY",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              const BottomBar(),
            ],
          )),
    );
  }
}
