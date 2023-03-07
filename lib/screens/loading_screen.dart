import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const String apiKey = 'f95f68ab006afdd9a9ebe6fe320c00f0';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(url:
        'https://api.openweathermap.org/data/2.5/weather?'
        'lat=$latitude&'
        'lon=$longitude&'
        'appid=$apiKey'
    );

    var weatherData = await networkHelper.getData();

    // int condition = weatherData['weather'][0]['id'];
    // double temperature = weatherData['main']['temp'];
    // String cityName = weatherData['name'];
  }



  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
