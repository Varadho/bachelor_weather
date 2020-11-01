import 'package:flutter/widgets.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/weather_repository.dart';

class WeatherNotifier extends ChangeNotifier {
  WeatherState weather = WeatherRepository().currentWeather;
  final WeatherRepository _wr = WeatherRepository();

  void changeTime(DateTime newTime) {
    weather = _wr.changeTime(newTime);
    notifyListeners();
  }

  void changeLocation(LocationData newLocation) {
    weather = _wr.changeLocation(newLocation);
    notifyListeners();
  }
}
