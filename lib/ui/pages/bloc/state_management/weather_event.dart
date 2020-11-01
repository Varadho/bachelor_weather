part of 'weather_bloc.dart';

class WeatherEvent {
  const WeatherEvent();
  // ignore: type_annotate_public_apis
  get nextState => null;

  Future<void> performAction(WeatherBloc weatherBloc) async {}
}

class TimeChangedEvent extends WeatherEvent {
  final DateTime newTime;
  const TimeChangedEvent(this.newTime);
}

class LocationChangedEvent extends WeatherEvent {
  final LocationData newLocation;
  const LocationChangedEvent(this.newLocation);
}
