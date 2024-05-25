import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: const Column(
          children: [
            Text(
              'Weather App',
              style: TextStyle(
                fontSize: 30
              ),
            ),
            Row(
              children: [
                Icon(Icons.color_lens),
                Text('Themes')
              ],
            )
          ],
        ),
      ),
    );
  }
}