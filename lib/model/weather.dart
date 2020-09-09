import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'atmospheric_data.dart';
import 'location.dart';
import 'temperatures.dart';

part 'weather.g.dart';

class Weather {
  final int cityID;
  final String cityName;
  final Coordinates coordinates;
  final String country;
  final Temperature info;
  final Wind wind;
  final String characteristic;
  final String description;
  final int clouds;
  final int sunrise, sunset;
  final int pressure;
  final int humidity;
  final DateTime time;
  final int _timezone;
  int get timezone => _timezone;

  Location get location => Location(
        cityID: cityID,
        country: country,
        cityName: cityName,
        coordinates: coordinates,
      );

  AtmosphericData get atmosphere => AtmosphericData(
        pressure: pressure,
        humidity: humidity,
        clouds: clouds,
        description: description,
      );

  Temperatures get temperature => Temperatures(
        avg: info.temperature,
        feelsLike: info.feelsLike,
        min: info.tempMin,
        max: info.tempMax,
      );

  const Weather({
    this.pressure,
    this.humidity,
    this.cityID,
    this.cityName,
    this.coordinates,
    this.country,
    this.info,
    this.wind,
    this.characteristic,
    this.description,
    this.clouds,
    this.sunrise,
    this.sunset,
    this.time,
    int timezone,
  }) : _timezone = timezone ?? 0;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        coordinates: Coordinates.fromJson(json['coord']),
        country: json['country'],
        cityName: json['name'],
        cityID: json['id'] as int,
        info: Temperature.fromJson(json['main']),
        pressure: json['main']['pressure'] as int,
        humidity: json['main']['humidity'] as int,
        wind: Wind.fromJson(json['wind']),
        characteristic: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        clouds: json['clouds']['all'] as int,
        sunrise: (json['sunrise'] as int) * 1000,
        sunset: (json['sunset'] as int) * 1000,
        time: DateTime.fromMillisecondsSinceEpoch((json["dt"] as int) * 1000),
        timezone: (json["timezone"] as int),
      );

  @override
  String toString() => 'Weather{cityID: $cityID, cityName: $cityName, '
      'coordinates: $coordinates, country: $country, '
      'info: $info, wind: $wind, characteristic: $characteristic, '
      'description: $description, clouds: $clouds, sunrise: $sunrise, '
      'sunset: $sunset, pressure: $pressure, humidity: $humidity, '
      'time: $time, _timezone: $_timezone}';

  Map<String, dynamic> toJson() => jsonDecode(toString());
}

@JsonSerializable()
class Temperature {
  @JsonKey(name: 'temp')
  final double temperature;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  @JsonKey(name: 'feels_like')
  final double feelsLike;

  Temperature({
    this.temperature,
    this.tempMin,
    this.tempMax,
    this.feelsLike,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
  @override
  String toString() =>
      'Info{temperature: $temperature, tempMin: $tempMin, tempMax: $tempMax, '
      'feelsLike: $feelsLike}';
}

@JsonSerializable()
class Wind {
  @JsonKey(name: 'speed')
  final double mpsSpeed;
  final double deg;

  @override
  String toString() => 'Wind{speed: $mpsSpeed, deg: $deg}';

  Wind({this.mpsSpeed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@JsonSerializable()
class Coordinates {
  final double lat, lon;
  @override
  String toString() => 'Coordinates{lat: $lat, lon: $lon}';

  const Coordinates({this.lat, this.lon});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
