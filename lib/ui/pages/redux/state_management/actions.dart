import '../../../../model/weather_state.dart';

///Abstract class which is the base for our Redux Actions
abstract class WeatherAction {}

///Action which describes a change of time to the chronologically next Time
class IncrementTimeAction extends WeatherAction {}

///Action which describes a change of time to the chronologically previous time
class DecrementTimeAction extends WeatherAction {}

///Action which describes a change of location
class ChangeLocationAction extends WeatherAction {
  ///Payload of this action
  final LocationData newLocation;

  ///Standard constructor, which allows to pass a LocationData payload
  ChangeLocationAction(this.newLocation);
}
