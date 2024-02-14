import 'package:flutter/material.dart';

TextTheme pixelifyTextTheme = const TextTheme(
  bodyLarge: TextStyle(fontSize: 24.0),
  bodyMedium: TextStyle(fontSize: 20.0),
  bodySmall: TextStyle(fontSize: 16.0),
  displayLarge: TextStyle(fontSize: 70.0),
  displayMedium: TextStyle(fontSize: 70.0),
  displaySmall: TextStyle(fontSize: 70.0),
  headlineLarge: TextStyle(fontSize: 24.0),
  headlineMedium: TextStyle(fontSize: 20.0),
  headlineSmall: TextStyle(fontSize: 16.0),
  labelLarge: TextStyle(fontSize: 20.0),
  labelMedium: TextStyle(fontSize: 16.0),
  labelSmall: TextStyle(fontSize: 12.0),
  titleLarge: TextStyle(fontSize: 24.0),
  titleMedium: TextStyle(fontSize: 20.0),
  titleSmall: TextStyle(fontSize: 16.0),
);

TextStyle getAppBarTitleTextStyle(BuildContext context) => TextStyle(
      letterSpacing: 4.0,
      fontFamily: 'Monofett',
      fontSize: 32.0,
      // height: 1.0,
      color: Theme.of(context).colorScheme.primary,
    );
