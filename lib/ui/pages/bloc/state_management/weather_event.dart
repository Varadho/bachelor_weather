part of 'weather_bloc.dart';

///Abstract class which is the base for weather events.
abstract class WeatherEvent {}

///Event which described a change of time to the chronologically next one
class IncrementTimeEvent extends WeatherEvent {}

///Event which described a change of time to the chronologically previous one
class DecrementTimeEvent extends WeatherEvent {}

///Event which described a change of location
class LocationChangedEvent extends WeatherEvent {
  ///Payload of the event
  final LocationData newLocation;

  ///Standard constructor, which allows to pass a LocationData payload
  LocationChangedEvent(this.newLocation);
}
