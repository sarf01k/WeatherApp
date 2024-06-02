import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherRepository weatherRepository = WeatherRepository();

  Weather? _weather;
  bool _isLoading = false;
  String? _errorMessage;
  Position? _position;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Position? get position => _position;

  Future<void> fetchWeather() async {
    try {
      _isLoading = true;
      notifyListeners();

      _position = await getCoordinates();
      notifyListeners();

      _weather = await weatherRepository.getWeather(_position!.latitude, _position!.longitude);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
      _weather = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Position> getCoordinates() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }

  // Future getLocation(double latitude, double longitude) async {
  //   return await placemarkFromCoordinates(latitude, longitude);
  // }
}