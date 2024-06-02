import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/location.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final url = const String.fromEnvironment('BASE_URL');

  final apiKey = const String.fromEnvironment('API_KEY');

  Future<Weather> getWeather() async {
    final Position coordinates = await getCoordinates();

    try {
      final response = await http.get(Uri.parse('${url}lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=${apiKey}'));
      if (response.statusCode == 200) {
        try {
          final weather = Weather.fromJSON(jsonDecode(response.body));
          return weather;
        } catch (e) {
          throw Exception('Failed to parse weather data');
        }
      } else {
        throw Exception('Failed to load weather');
      }
    } on Exception catch (e) {
      throw Exception('Failed to load weather');
    }
  }

  getLocation() async {
    final Position coordinates = await getCoordinates();
    final List<Placemark> location = await placemarkFromCoordinates(coordinates.latitude, coordinates.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '22 August, Monday',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined, size: 30),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getWeather(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              final Weather? weather = snapshot.data;
              return Text('${weather!.sys!.country}');
            } else {
              return Center(
                child: Text('Failed to load weather')
              );
            }
          })
        )
      )
    );
  }
}