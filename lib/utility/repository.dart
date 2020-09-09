import 'package:flutter/foundation.dart';
import 'package:time/time.dart';

import '../model/location.dart';
import '../model/weather.dart';
import 'api_helper.dart';
import 'constants/favorite_locations.dart';

class WeatherRepository {
  static final WeatherRepository _singleton = WeatherRepository._internal();

  factory WeatherRepository() => _singleton;

  WeatherRepository._internal() {
    _currentLocation = _locations.first;
    _loadData();
  }

  Location _currentLocation;
  DateTime _currentTime = DateTime.now();
  static const List<Location> _locations = favoriteLocations;
  final Map<Location, List<Weather>> _weatherMap = {};

  bool _loading = false;
  bool get isLoading => _loading;

  List<Weather> get forecast => _weatherMap[_currentLocation];
  Weather get currentWeather => forecast.firstWhere(
        (w) => w.time.difference(_currentTime) <= 1.5.hours,
        orElse: () => _currentTime.difference(DateTime.now()).isNegative
            ? forecast.first
            : forecast.last,
      );

  void _loadWeatherForLocation(Location loc) async {
    debugPrint("Loading weather for: $loc");
    var weatherList = await ApiHelper.get5DayForecastFor(loc.cityName);
    _weatherMap[loc] = weatherList;
    debugPrint("Weather for $loc loaded: ${_weatherMap[loc]}");
  }

  Weather changeTime(DateTime newTime) {
    _currentTime = newTime;
    debugPrint(
        "Changed time to ${_currentTime.hour.toString().padLeft(2, "0")}:"
        "${_currentTime.minute.toString().padLeft(2, "0")}");
    return currentWeather;
  }

  Weather changeLocation(Location l) {
    _currentLocation = l;
    debugPrint("Changed Location to: $_currentLocation");
    return currentWeather;
  }

  void _loadData() async {
    _loading = true;
    debugPrint("Loading WeatherData");
    for (var location in _locations) {
      await _loadWeatherForLocation(location);
    }
    _loading = false;
    debugPrint("Loading WeatherData Complete");
  }
}
