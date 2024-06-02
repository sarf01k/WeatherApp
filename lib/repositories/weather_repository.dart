import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class WeatherRepository {
  final url = const String.fromEnvironment('BASE_URL');
  final apiKey = const String.fromEnvironment('API_KEY');

  Future<Weather> getWeather(double latitude, double longitude) async {
    try {
      final response = await http.get(Uri.parse('$url$latitude,$longitude?key=$apiKey'));

      if (response.statusCode == 200) {
        return Weather.fromJSON(jsonDecode(response.body));
      } else {
        throw Exception('Failed to get weather');
      }
    } on Exception catch (e) {
        throw Exception('Failed to load weather');
    }
  }
}