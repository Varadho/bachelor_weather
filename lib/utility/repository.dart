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

  Weather changeLocation(Location l) {
    _currentLocation = l;
    return currentWeather;
  }

  void _loadWeatherForLocation(Location loc) async {
    var weatherList = await ApiHelper.get5DayForecastFor(loc.cityName);
    for (var w in weatherList) {
      print(w.time);
    }
    _weatherMap[loc] = weatherList;
  }

  void _loadData() async {
    _loading = true;
    for (var location in _locations) {
      await _loadWeatherForLocation(location);
    }
    _loading = false;
  }
}
