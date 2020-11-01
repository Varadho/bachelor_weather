import '../../../../model/weather_state.dart';

abstract class WeatherAction {}

class ChangeTimeAction extends WeatherAction {
  final DateTime newTime;
  ChangeTimeAction(this.newTime);
}

class ChangeLocationAction extends WeatherAction {
  final LocationData newLocation;
  ChangeLocationAction(this.newLocation);
}
