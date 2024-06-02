import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/theme.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/home/widgets/weather_info_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Position _coordinates;
  // late final Position _coordinates;
  // List<Placemark> location= [];

  @override
  void initState() {
    super.initState();
    getCurrentCoordinates();
  }

  getCurrentCoordinates() {
    final weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    weatherProvider.getCoordinates().then((value) {
      _coordinates = value;
      print(_coordinates);
    });
  }

  @override
  void dispose() {
    // _coordinates = null;
    // location = [];
    super.dispose();
  }

  // getCurrentLocation() async {
  //   location = await weatherProvider.getLocation(coordinates!.latitude, coordinates!.longitude);
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, _) {
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
            child: Consumer<WeatherProvider>(
              builder: (context, provider, _) {
                return  Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              // getCurrentCoordinates();
                            },
                            child: Text('GC')
                          ),
                          TextButton(
                            onPressed: () {
                              // getCurrentCoordinates();
                            },
                            child: Text('GL')
                          ),
                          SizedBox(height: MediaQuery.sizeOf(context).height * .08),
                          Text(
                            '37°',
                            style: theme.textTheme.bodyLarge,
                          ),
                          SizedBox(height: MediaQuery.sizeOf(context).height * .05),
                          Image.asset(
                            'assets/images/storm.png',
                            scale: .9,
                          ),
                          SizedBox(height: MediaQuery.sizeOf(context).height * .02),
                          Column(
                            children: [
                              Text(
                                'Perfect day today',
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                _coordinates.latitude.toString(),
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Positioned(
                        top: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WeatherInfoCard(
                              image: 'assets/images/wind.png',
                              name: 'Wind Force',
                              values: '5/km',
                            ),
                            WeatherInfoCard(
                              image: 'assets/images/humidity.png',
                              name: 'Humidity',
                              values: '123',
                            ),
                            WeatherInfoCard(
                              image: 'assets/images/windsock.png',
                              name: 'Precipitation',
                              values: '456',
                            )
                          ],
                        )
                      )
                    ],
                  ),
                );
              }
            )
          ),
        );
      }
    );
  }
}