import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
import 'package:weather/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        'appid=$apiKey&'
        'units=metric'
    );

    var weatherData = await networkHelper.getData();

    if(!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));

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
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
