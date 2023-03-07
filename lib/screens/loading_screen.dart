import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';

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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
}
