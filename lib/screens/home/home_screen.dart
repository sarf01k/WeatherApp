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

  Position? coordinates;
  List<Placemark>? location;

  Future<List<Placemark>?> getLocation() async {
    location = await placemarkFromCoordinates(coordinates!.latitude, coordinates!.longitude);
    return location;
  }

  Future<Weather> getWeather() async {
    coordinates = await getCoordinates();

    try {
      final response = await http.get(Uri.parse('${url}lat=${coordinates!.latitude}&lon=${coordinates!.longitude}&appid=${apiKey}&units=metric'));
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
        child: Column(
          children: [
            FutureBuilder(
              future: getWeather(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  final Weather? weather = snapshot.data;
                  return Text('${weather!.main!.humidity}');
                } else {
                  return Center(
                    child: Text('Failed to load weather')
                  );
                }
              })
            ),
            FutureBuilder(
              future: getLocation(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  final _location = snapshot.data;
                  return Text('${_location![0].administrativeArea}, ${_location![0].country}');
                } else {
                  return Center(
                    child: Text('Failed to load weather')
                  );
                }
              })
            )
          ],
        )
      )
    );
  }
}