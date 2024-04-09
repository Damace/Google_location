import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vms/splash_screen.dart';
import 'package:vms/users_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserController pointController = Get.put(UserController());

  late GoogleMapController mapController;

  //final LatLng _center = const LatLng(-6.161184, 35.745426);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    pointController.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
            child: Obx(() => pointController.users.isNotEmpty
                ? GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(pointController.users.first.lat,
                          pointController.users.first.lng),
                      zoom: 14.0,
                    ),
                    markers: Set.from(pointController.markers)
                    // Set of markers on the map
                    )
                : Center(
                    child: CircularProgressIndicator(),
                  )),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 50,
            backgroundColor: Colors.white,
            selectedLabelStyle: TextStyle(
              color: Colors.white,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.white,
            ),
            items: [
              BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(
                                    title: '',
                                  )
                              // builder: (context) =>Register()

                              ));
                    },
                    child: Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 21, 139, 236),
                    ),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SplashPage()
                              // builder: (context) =>Register()

                              ));
                    },
                    child: Icon(
                      Icons.map_outlined,
                      color: Color.fromARGB(255, 21, 139, 236),
                    ),
                  ),
                  label: 'Refresh map'),
            ],
          )),
    );
  }
}
