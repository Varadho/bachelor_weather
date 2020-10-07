import 'package:json_annotation/json_annotation.dart';
import 'package:time/time.dart';

part 'atmospheric_data.dart';
part 'coord.dart';
part 'location_data.dart';
part 'temp_data.dart';
part 'weather.g.dart';
part 'wind_data.dart';

class WeatherState {
  final LocationData location;
  final DateTime time;
  final AtmosphericData atmosphere;
  final TemperatureData temperature;
  final WindData wind;

  WeatherState({
    this.atmosphere,
    this.location,
    this.temperature,
    this.wind,
    int time,
  }) : time = DateTime.fromMillisecondsSinceEpoch(time * 1000, isUtc: true);

  factory WeatherState.empty() => WeatherState(
        location: LocationData(),
        time: (DateTime.now().millisecondsSinceEpoch / 1000).floor(),
        temperature: TemperatureData(),
        atmosphere: AtmosphericData(),
        wind: WindData(),
      );

  @override
  String toString() => 'Weather{atmosphere: $atmosphere, location: $location, '
      'temperature: $temperature, wind: $wind, time: $time}';
}
