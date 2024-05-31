import 'package:flutter/material.dart';

class WeeklyTile extends StatelessWidget {
  const WeeklyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.sizeOf(context).height * .13,
      decoration: BoxDecoration(
        border: Border.all(width: 2, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('25°'),
          Icon(Icons.sunny),
          Text('21 Jan')
        ],
      ),
    );
  }
}