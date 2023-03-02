import 'package:geolocator/geolocator.dart';

class Location {
  late double _latitude;
  late double _longitude;

  double get latitude => _latitude;
  double get longitude => _longitude;

  Future<void> getCurrentLocation() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    _latitude = position.latitude;
    _longitude = position.longitude;
  }
}