import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final url = const String.fromEnvironment('BASE_URL');

  final apiKey = const String.fromEnvironment('API_KEY');

  Position? coordinates;
  List<Placemark>? location;

  Future<Weather> getWeather() async {
    coordinates = await getCoordinates();
    location = await placemarkFromCoordinates(coordinates!.latitude, coordinates!.longitude);

    final response = await http.get(Uri.parse('${url}lat=${coordinates!.latitude}&lon=${coordinates!.longitude}&appid=$apiKey&units=metric'));
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
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMMM d').format(now);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFEBF1FF)
        ),
        child: SafeArea(
          child: FutureBuilder(
            future: getWeather(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitThreeBounce(
                    duration: Durations.medium4,
                    color: Colors.black,
                    size: 15,
                  ),
                );
              }
              if (snapshot.hasData) {
                final Weather? weather = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${weather!.weather![0].main}',
                      style: const TextStyle(
                        fontSize: 18
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      child: Column(
                        children: [
                          Placeholder(
                            color: Colors.transparent,
                            child: Image.network('https://openweathermap.org/img/wn/${weather.weather![0].icon}@2x.png'),
                          ),
                          Text(
                            getCurrentDate().toString(),
                            style: const TextStyle(
                              fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 0),
                    Text(
                      '${weather.main!.temp!.ceil()}°',
                      style: const TextStyle(
                        fontSize: 150,
                        height: .77,
                      ),
                    ),
                    Text(
                      '${location![0].administrativeArea}',
                      style: const TextStyle(
                        fontSize: 25
                      ),
                    ),
                    const SizedBox(height: 30),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Icon(Icons.cloud_outlined),
                              Text(
                                '${weather.main!.pressure}%',
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 30),
                          const VerticalDivider(thickness: .5, color: Colors.black),
                          const SizedBox(width: 30),
                          Column(
                            children: [
                              const Icon(Icons.water_drop_outlined),
                              Text(
                                '${weather.main!.humidity}%',
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 30),
                          const VerticalDivider(thickness: .5, color: Colors.black),
                          const SizedBox(width: 30),
                          Column(
                            children: [
                              const Icon(Icons.air),
                              Text(
                                '${weather.wind!.speed!.ceil()} mph',
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: Column(
                    children: [
                      const Text(
                        'Failed to load weather',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            getWeather();
                          });
                        },
                        child: const Text(
                          'Retry'
                        )
                      )
                    ],
                  )
                );
              }
            })
          )
        ),
      )
    );
  }
}