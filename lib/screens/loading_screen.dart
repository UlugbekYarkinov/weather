import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Current latitude: ${location.latitude} and longitude: ${location.longitude}');
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?'
          'lat=41&'
          'lon=69&'
          'appid=f95f68ab006afdd9a9ebe6fe320c00f0'
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
