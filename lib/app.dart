import 'package:flutter/material.dart';
import 'package:weather_app/common/theme.dart';
import 'package:weather_app/screens/home/home_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(scaffoldBackgroundColor: const Color(0xFF195A5D)),
      home: HomeScreen(),
    );
  }
}
