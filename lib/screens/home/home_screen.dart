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
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final url = const String.fromEnvironment('BASE_URL');

  final apiKey = const String.fromEnvironment('API_KEY');

  Position? coordinates;
  List<Placemark>? location;

  // @override
  // void initState() {
  //   super.initState();
  //   getCo();
  // }

  // Future<List<Placemark>?> getLocation() async {
  //   location = await placemarkFromCoordinates(coordinates!.latitude, coordinates!.longitude);
  //   return location;
  // }
  // getCo() async {
  //   coordinates = await getCoordinates();
  //   print(coordinates);
  // }

  Future<Weather> getWeather() async {
    coordinates = await getCoordinates();
    location = await placemarkFromCoordinates(coordinates!.latitude, coordinates!.longitude);

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

  String getCurrentDate() {
    DateTime now = DateTime.now(); // Get the current date and time
    String formattedDate = DateFormat('EEEE, MMMM d').format(now); // Format the date
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [Color(0xFF365A7A), Color(0xFF041C48)]
          )
        ),
        child: SafeArea(
          child: FutureBuilder(
            future: getWeather(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SpinKitThreeBounce(
                    color: Colors.white,
                    size: 15,
                  ),
                );
              }
              if (snapshot.hasData) {
                final Weather? weather = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network('https://openweathermap.org/img/wn/${weather!.weather![0].icon}@2x.png', scale: .5,),
                    Text(getCurrentDate().toString()),
                    Text('${weather!.main!.temp!.ceil()}°'),
                    Text('${location![0].administrativeArea}, ${location![0].country}'),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.cloud),
                              Text('${weather.main!.pressure}'),
                            ],
                          ),
                          VerticalDivider(thickness: .5),
                          Column(
                            children: [
                              Icon(Icons.water_drop_outlined),
                              Text('${weather.main!.humidity}'),
                            ],
                          ),
                          VerticalDivider(thickness: .5),
                          Column(
                            children: [
                              Icon(Icons.air),
                              Text('${weather.wind!.speed!.ceil()}'),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: Text('Failed to load weather')
                );
              }
            })
          )
        ),
      )
    );
  }
}