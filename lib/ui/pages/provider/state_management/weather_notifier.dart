import 'package:flutter/widgets.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/weather_repository.dart';

///Weather Notifier which is in charge is changing the currently displayed
///weather state and notifying listeners
class WeatherNotifier extends ChangeNotifier {
  ///The weather which represents the current state
  WeatherState weather = WeatherRepository().currentWeather;
  final WeatherRepository _wr = WeatherRepository();

  ///Method to change the time of the displayed Weather and notify all listeners
  void changeTime(DateTime newTime) {
    weather = _wr.changeTime(newTime);
    notifyListeners();
  }

  ///Method to change the location of the displayed weather and notify all
  ///listeners
  void changeLocation(LocationData newLocation) {
    weather = _wr.changeLocation(newLocation);
    notifyListeners();
  }
}
