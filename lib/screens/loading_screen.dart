import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Location location;
  double lat = 0;
  double lon = 0;
  String API_KEY = "a1cc62b6f0acdbbec9da54a1903c7f4f";

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    lon = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=hourly,daily&appid=$API_KEY");

    var data = await networkHelper.getData();
    print(data);
  }

  @override
  void initState() {
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
