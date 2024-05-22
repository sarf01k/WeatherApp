import 'package:flutter/material.dart';
import 'package:weather_app/views/drawer_view.dart';
import 'package:weather_app/widgets/weather_info_card.dart';
import 'package:weather_app/widgets/weekly_tile.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        // toolbarHeight: 50,
        title: const Text(
          '22 August, Monday',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * .08),
                    const Text(
                      '37°',
                      style: TextStyle(
                          fontSize: 180,
                          height: .8,
                          backgroundColor: Colors.amber,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .05),
                    Image.asset(
                      'lib/assets/images/storm.png',
                      scale: .9,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .02),
                    const Column(
                      children: [
                        Text(
                          'Perfect day today',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Mostaganem, Algeria',
                          style: TextStyle(fontSize: 20),
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
                        WeatherInfoCard(),
                        WeatherInfoCard(),
                        WeatherInfoCard()
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
