import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'f95f68ab006afdd9a9ebe6fe320c00f0';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?'
          'lat=$latitude&'
          'lon=$longitude&'
          'appid=$apiKey'
    ));
    if(response.statusCode == 200) {
      String data = response.body;

      int condition = jsonDecode(data)['weather'][0]['id'];
      double temperature = jsonDecode(data)['main']['temp'];
      String cityName = jsonDecode(data)['name'];

      print(condition);
      print(temperature);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
