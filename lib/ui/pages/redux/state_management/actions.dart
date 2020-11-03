import '../../../../model/weather_state.dart';

///Abstract class which is the base for our Redux Actions
abstract class WeatherAction {}

///Action which describes a change of time
class ChangeTimeAction extends WeatherAction {
  ///Payload if this action
  final DateTime newTime;
  // ignore: public_member_api_docs
  ChangeTimeAction(this.newTime);
}

///Action which describes a change of location
class ChangeLocationAction extends WeatherAction {
  ///Payload of this action
  final LocationData newLocation;
  // ignore: public_member_api_docs
  ChangeLocationAction(this.newLocation);
}
