import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roc Grotesk',
  appBarTheme: _appBarTheme,
  textTheme: _textTheme,
);

const AppBarTheme _appBarTheme = AppBarTheme(
  elevation: 0,
  foregroundColor: Color(0xFFFFFFFF),
  backgroundColor: Color(0xFF195A5D),
  surfaceTintColor: Colors.black,
);

const TextTheme _textTheme = TextTheme(
  titleLarge:
      TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),
  bodyLarge: TextStyle(
      fontSize: 160,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      height: .8),
  bodyMedium:
      TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
  bodySmall:
      TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
  displayMedium:
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
  displaySmall:
      TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white),
);
