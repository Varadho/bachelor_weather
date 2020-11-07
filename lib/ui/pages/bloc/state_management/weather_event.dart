part of 'weather_bloc.dart';

///Abstract class which is the base for weather events.
abstract class WeatherEvent {
  // ignore: public_member_api_docs
  const WeatherEvent();
}

///Event which described a change of time to the chronologically next one
class IncrementTimeEvent extends WeatherEvent {
  // ignore: public_member_api_docs
  const IncrementTimeEvent();
}

///Event which described a change of time to the chronologically previous one
class DecrementTimeEvent extends WeatherEvent {
  // ignore: public_member_api_docs
  const DecrementTimeEvent();
}

///Event which described a change of location
class LocationChangedEvent extends WeatherEvent {
  ///Payload of the event
  final LocationData newLocation;
  // ignore: public_member_api_docs
  const LocationChangedEvent(this.newLocation);
}
