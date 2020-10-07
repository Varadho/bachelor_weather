import 'package:flutter/foundation.dart';
import 'package:time/time.dart';

import '../model/weather_state.dart';
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
  final Map<LocationData, List<WeatherState>> _weatherMap = {};

  bool _loading = false;
  bool get isLoading => _loading;

  List<WeatherState> get forecast =>
      _weatherMap[_currentLocation]?.isNotEmpty ?? false
          ? _weatherMap[_currentLocation]
          : [WeatherState.empty()];
  WeatherState get currentWeather => forecast.firstWhere(
        (w) => w.time.difference(_currentTime).abs() <= 1.5.hours,
        orElse: () => _currentTime.difference(DateTime.now()).isNegative
            ? forecast.first
            : forecast.last,
      );

  WeatherState changeTime(DateTime newTime) {
    if (newTime.difference(forecast.last.time).isNegative &&
        !newTime.difference(forecast.first.time + 5.minutes).isNegative) {
      _currentTime = newTime;
    }
    return currentWeather;
  }

  WeatherState changeLocation(LocationData l) {
    _currentLocation = l;
    return currentWeather;
  }

  void _loadWeatherForLocation(LocationData loc) async {
    var weatherList = await ApiHelper.get5DayForecastFor(loc.name);
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
