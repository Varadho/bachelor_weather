import 'package:flutter/foundation.dart';

import '../model/weather_state.dart';
import 'constants/favorite_locations.dart';
import 'network/api_helper.dart';

///Repository which loads and caches all WeatherStates
class WeatherRepository {
  static final WeatherRepository _singleton = WeatherRepository._internal();

  ///Only public constructor used to implement the singleton pattern
  factory WeatherRepository() => _singleton;

  WeatherRepository._internal() {
    _currentLocation = favoriteLocations.first;
    _loadData();
  }

  LocationData _currentLocation;
  int _currentTimeIndex = 0;
  final Map<LocationData, List<WeatherState>> _weatherMap = {};

  ///A getter which provides a  list of WeatherStates which represent the
  ///entire forecast for a specific location
  List<WeatherState> get forecast =>
      _weatherMap[_currentLocation]?.isNotEmpty ?? false
          ? _weatherMap[_currentLocation]
          : [WeatherState.empty()];

  ///A getter which provides a single WeatherState depending on the currently
  /// selected location and time.
  WeatherState get currentWeather => forecast[_currentTimeIndex];

  ///A method which changes the current [WeatherState]
  ///to the chronologically next one
  WeatherState incrementTime() {
    if (_currentTimeIndex < forecast.length - 1) {
      _currentTimeIndex++;
    }
    return currentWeather;
  }

  ///A method which changes the current [WeatherState]
  ///to the chronologically previous one
  WeatherState decrementTime() {
    if (_currentTimeIndex > 0) {
      _currentTimeIndex--;
    }
    return currentWeather;
  }

  ///A method which allows to change the currentLocation in the repository and
  ///returns the corresponding [WeatherState]
  WeatherState changeLocation(LocationData l) {
    _currentLocation = l;
    return currentWeather;
  }

  void _loadWeatherForLocation(LocationData loc) async {
    var weatherList = await ApiHelper.get5DayForecastFor(loc.name);
    _weatherMap[loc] = weatherList;
  }

  void _loadData() async {
    for (var location in favoriteLocations) {
      await _loadWeatherForLocation(location);
    }
    debugPrint("Loading weather data complete");
    debugPrint(toString());
  }

  @override
  String toString() => 'WeatherRepository{'
      '_currentLocation: $_currentLocation, '
      '_currentTime: ${currentWeather.time}, '
      '_weatherMap: $_weatherMap'
      '}';
}
