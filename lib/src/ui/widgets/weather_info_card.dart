import 'package:flutter/material.dart';
import 'package:weather_app/src/common/theme.dart';

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.sizeOf(context).height * .0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/wind.png',
            scale: 2.8,
          ),
          Column(
            children: [
              Text(
                'Wind Force',
                style: theme.textTheme.displayMedium,
              ),
              Text(
                'Wind',
                style: theme.textTheme.displaySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
