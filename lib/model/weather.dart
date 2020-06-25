import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

class Weather {
  final Coordinates coordinates;
  final String country;
  final Info info;
  final Wind wind;
  final String characteristic;
  final String description;
  final int visibility;
  final int clouds;
  final int sunrise, sunset;

  const Weather({
    this.coordinates,
    this.country,
    this.characteristic,
    this.description,
    this.info,
    this.visibility,
    this.wind,
    this.clouds,
    this.sunrise,
    this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        coordinates: Coordinates.fromJson(json['coord']),
        country: json['sys']['country'],
        info: Info.fromJson(json['main']),
        wind: Wind.fromJson(json['wind']),
        characteristic: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        visibility: json['visibility'] as int,
        clouds: json['clouds']['all'] as int,
        sunrise: json['sys']['sunrise'] as int,
        sunset: json['sys']['sunset'] as int,
      );
  @override
  String toString() {
    return '{Weather:{coordinates: $coordinates, country: $country, info: '
        '$info, wind: $wind, characteristic: $characteristic, description: '
        '$description, visibility: $visibility, clouds: $clouds, sunrise: $sunrise, sunset: $sunset}}';
  }

  Map<String, dynamic> toJson() => jsonDecode(this.toString());
}

@JsonSerializable()
class Info {
  @JsonKey(name: 'temp')
  final double temperature;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  final int pressure;
  final int humidity;

  Info({
    this.temperature,
    this.tempMin,
    this.tempMax,
    this.feelsLike,
    this.pressure,
    this.humidity,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
  @override
  String toString() {
    return 'Info{temperature: $temperature, tempMin: $tempMin, tempMax: $tempMax, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity}';
  }
}

@JsonSerializable()
class Wind {
  final double speed;
  final int deg;

  @override
  String toString() {
    return 'Wind{speed: $speed, deg: $deg}';
  }

  Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@JsonSerializable()
class Coordinates {
  final double lat, lon;
  @override
  String toString() {
    return 'Coordinates{lat: $lat, lon: $lon}';
  }

  Coordinates({this.lat, this.lon});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
