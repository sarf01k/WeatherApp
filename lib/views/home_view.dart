import 'package:flutter/material.dart';
import 'package:weather_app/views/drawer_view.dart';

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
      drawer: const SafeArea(
        child: DrawerView()
      ),
      appBar: AppBar(
        toolbarHeight: 50,
        leading: IconButton(
          onPressed: () {
            if(scaffoldKey.currentState!.isDrawerOpen){
              scaffoldKey.currentState!.closeDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
          icon: const Icon(Icons.menu)
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, size: 20),
            const SizedBox(width: 10),
            const Text(
              'Paris',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Text('Friday, 20 January'),
                ),
                const Text('Sunny'),
                const Text(
                  '31°',
                  style: TextStyle(
                    fontSize: 200,
                    height: .8,
                    backgroundColor: Colors.amber
                  ),
                ),
                const Row(
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
                const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In finibus purus turpis, id dignissim neque molestie dictum.'),
                Container(
                  height: MediaQuery.sizeOf(context).height * .18,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .12,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.air_outlined, color: Colors.white, size: 38),
                            Column(
                              children: [
                                Text(
                                  '42.2km/h',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.water_drop_outlined, color: Colors.white),
                      const Icon(Icons.remove_red_eye_outlined, color: Colors.white)
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Weekly forecast',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward))
                        ],
                      ),
                      Row(
                        children: [
                          Container(
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