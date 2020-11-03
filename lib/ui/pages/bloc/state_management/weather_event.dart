part of 'weather_bloc.dart';

///Abstract class which is the base for weather events.
abstract class WeatherEvent {
  // ignore: public_member_api_docs
  const WeatherEvent();
}

///Event which described a change of time
class TimeChangedEvent extends WeatherEvent {
  ///Payload of the event
  final DateTime newTime;
  // ignore: public_member_api_docs
  const TimeChangedEvent(this.newTime);
}

///Event which described a change of location
class LocationChangedEvent extends WeatherEvent {
  ///Payload of the event
  final LocationData newLocation;
  // ignore: public_member_api_docs
  const LocationChangedEvent(this.newLocation);
}
