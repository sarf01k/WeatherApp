import 'package:flutter/material.dart';
import 'package:weather_app/common/theme.dart';

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard(
      {super.key,
      required this.image,
      required this.name,
      required this.values});
  final String image, name, values;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            scale: 2.8,
          ),
          Column(
            children: [
              Text(
                name,
                style: theme.textTheme.displayMedium,
              ),
              Text(
                values,
                style: theme.textTheme.displaySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
