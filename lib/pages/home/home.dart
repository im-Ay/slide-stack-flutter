import 'package:flutter/material.dart';
import 'package:slide_stack/widgets/bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            "Blocky Stack",
                            style: TextStyle(
                                fontSize: 36.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pushNamed(context, "/maps"),
                      child: const Text("PLAY"),
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
