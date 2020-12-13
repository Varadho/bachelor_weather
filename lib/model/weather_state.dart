import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:time/time.dart';

part 'atmospheric_data.dart';
part 'coord.dart';
part 'location_data.dart';
part 'temp_data.dart';
part 'weather_state.g.dart';
part 'wind_data.dart';

///Class which describes the weather for a specific time and place.
///It is composed of multiple other classes which hold more specific data
///This and all other component classes extend Equatable to make comparison of
///[WeatherState]s easier.
@immutable
class WeatherState extends Equatable {
  ///Information about the location
  final LocationData location;

  ///Timestamp of the weather
  final DateTime time;

  ///Information about atmospheric data
  final AtmosphericData atmosphere;

  ///Information about temperature data
  final TemperatureData temperature;

  ///Information about wind Data
  final WindData wind;

  ///Standard constructor for the WeatherState
  ///The Time provided by the API is in seconds since epoch, therefore must be
  ///multiplied by 1000 to convert to a [DateTime] object.
  WeatherState({
    this.atmosphere,
    this.location,
    this.temperature,
    this.wind,
    int time,
  }) : time = DateTime.fromMillisecondsSinceEpoch(time * 1000, isUtc: true);

  ///Factory constructor which returns a WeatherState with no Data (all
  ///values set to 0 or "", depending on the Type, time is set to "now"
  factory WeatherState.empty() => WeatherState(
        location: LocationData(timezone: 0),
        time: (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
        temperature: TemperatureData(),
        atmosphere: AtmosphericData(),
        wind: WindData(),
      );

  @override
  String toString() => 'Weather{atmosphere: $atmosphere, location: $location, '
      'temperature: $temperature, wind: $wind, time: $time}';

  @override
  List<Object> get props => [location, time, atmosphere, temperature, wind];
}
