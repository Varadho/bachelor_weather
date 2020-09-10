import 'package:json_annotation/json_annotation.dart';

part 'atmospheric_data.dart';
part 'coord.dart';
part 'location_data.dart';
part 'sun_time.dart';
part 'temp_data.dart';
part 'weather.g.dart';
part 'wind_data.dart';

@JsonSerializable(explicitToJson: true)
class Weather {
  final AtmosphericData atmosphere;
  final Coordinates coords;
  final LocationData location;
  final TemperatureData temperature;
  final WindData wind;

  final DateTime sunrise, sunset;
  final DateTime time;
  final int _timezone;

  Weather({
    this.atmosphere,
    this.coords,
    this.location,
    this.temperature,
    this.wind,
    int time,
    int sunrise,
    int sunset,
    int timezone,
  })  : time = DateTime.fromMillisecondsSinceEpoch(time),
        sunrise = DateTime.fromMillisecondsSinceEpoch(sunrise),
        sunset = DateTime.fromMillisecondsSinceEpoch(sunset),
        _timezone = timezone;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  @override
  String toString() =>
      'Weather{atmosphere: $atmosphere, coords: $coords, location: $location, '
      'temperature: $temperature, wind: $wind, sunrise: $sunrise, '
      'sunset: $sunset, time: $time, _timezone: $_timezone}';

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
