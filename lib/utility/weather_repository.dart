import 'package:flutter/foundation.dart';
import 'package:time/time.dart';

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
  DateTime _currentTime = DateTime.now();
  final Map<LocationData, List<WeatherState>> _weatherMap = {};

  ///A getter which provides a  list of WeatherStates which represent the
  ///entire forecast for a specific location
  List<WeatherState> get forecast =>
      _weatherMap[_currentLocation]?.isNotEmpty ?? false
          ? _weatherMap[_currentLocation]
          : [WeatherState.empty()];

  ///A getter which provides a single WeatherState depending on the currently
  /// selected location and time.
  WeatherState get currentWeather => forecast.firstWhere(
        (w) => w.time.difference(_currentTime).abs() <= 1.5.hours,
        orElse: () => _currentTime.difference(DateTime.now()).isNegative
            ? forecast.first
            : forecast.last,
      );

  ///A method which allows to change the currentTime in the repository and
  ///returns the corresponding [WeatherState]
  WeatherState changeTime(DateTime newTime) {
    if (newTime.difference(forecast.last.time).isNegative &&
        !newTime.difference(forecast.first.time).isNegative) {
      _currentTime = newTime;
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
      '_currentTime: $_currentTime, '
      '_weatherMap: $_weatherMap'
      '}';
}
