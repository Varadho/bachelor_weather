import '../../../../model/weather_state.dart';

///Abstract class which is the base for our Redux Actions
abstract class WeatherAction {}

///Action which describes a change of time to the chronologically next Time
class IncrementTimeAction extends WeatherAction {
  // ignore: public_member_api_docs
  IncrementTimeAction();
}

///Action which describes a change of time to the chronologically previous time
class DecrementTimeAction extends WeatherAction {
  // ignore: public_member_api_docs
  DecrementTimeAction();
}

///Action which describes a change of location
class ChangeLocationAction extends WeatherAction {
  ///Payload of this action
  final LocationData newLocation;
  // ignore: public_member_api_docs
  ChangeLocationAction(this.newLocation);
}
