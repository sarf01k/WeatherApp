import 'package:flutter/material.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE142),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu)
        ),
        title: const Text(
          'Paris',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text('Friday, 20 January'),
                ),
                Text('Sunny'),
                Text(
                  '31°',
                  style: TextStyle(
                    fontSize: 150
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Daily Summary',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In finibus purus turpis, id dignissim neque molestie dictum.'),
                Container(
                  height: MediaQuery.sizeOf(context).height * .18,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.waves, color: Colors.white),
                      Icon(Icons.water_drop_outlined, color: Colors.white),
                      Icon(Icons.remove_red_eye_outlined, color: Colors.white)
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * .18,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Weekly forecast',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            height: MediaQuery.sizeOf(context).height * .13,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('25°'),
                                Icon(Icons.sunny),
                                Text('21 Jan')
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}