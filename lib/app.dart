import 'package:flutter/material.dart';
import 'package:weather_app/views/home_view.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(fontFamily: 'Roc Grotesk'),
      home: Homeview(),
    );
  }
}
