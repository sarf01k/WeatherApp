import 'package:flutter/material.dart';
import 'package:weather_app/src/common/theme.dart';
import 'package:weather_app/src/ui/widgets/weather_info_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        // toolbarHeight: 50,
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
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
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
                        'Mostaganem, Algeria',
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
                      WeatherInfoCard(),
                      WeatherInfoCard(),
                      WeatherInfoCard()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
