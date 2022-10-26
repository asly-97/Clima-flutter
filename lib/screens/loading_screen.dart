import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Location location;

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print("Latitude: ${location.latitude}");
    print("Longitude: ${location.longitude}");
  }

  @override
  void initState() {
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
