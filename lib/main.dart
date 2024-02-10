import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slide_stack/app.dart';

void main() {
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}
