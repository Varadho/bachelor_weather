import 'package:flutter/cupertino.dart';
import 'package:time/time.dart';

import '../model/weather.dart';
import 'api_helper.dart';
import 'constants/favorite_locations.dart';

class WeatherRepository {
  static final WeatherRepository _singleton = WeatherRepository._internal();

  factory WeatherRepository() => _singleton;

  WeatherRepository._internal() {
    _currentLocation = favoriteLocations.first;
    _loadData();
  }

  LocationData _currentLocation;
  DateTime _currentTime = DateTime.now();
  final Map<LocationData, List<Weather>> _weatherMap = {};

  bool _loading = false;
  bool get isLoading => _loading;

  List<Weather> get forecast => _loading ? [] : _weatherMap[_currentLocation];
  Weather get currentWeather => forecast?.firstWhere(
        (w) => w.time.difference(_currentTime).abs() <= 1.5.hours,
        orElse: () => _currentTime.difference(DateTime.now()).isNegative
            ? forecast.first
            : forecast.last,
      );

  Weather changeTime(DateTime newTime) {
    _currentTime = newTime;
    return currentWeather;
  }

  Weather changeLocation(LocationData l) {
    _currentLocation = l;
    return currentWeather;
  }

  void _loadWeatherForLocation(LocationData loc) async {
    var weatherList = await ApiHelper.get5DayForecastFor(loc.cityName);
    _weatherMap[loc] = weatherList;
  }

  void _loadData() async {
    _loading = true;
    for (var location in favoriteLocations) {
      await _loadWeatherForLocation(location);
    }
    _loading = false;
    debugPrint("Loading weather data complete");
  }
}
