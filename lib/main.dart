import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create:(context) => WeatherProvider(),
      child: const WeatherApp()
    )
  );
}
