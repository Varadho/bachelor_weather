// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map<String, dynamic> json) {
  return Temperature(
    temperature: (json['temp'] as num)?.toDouble(),
    tempMin: (json['temp_min'] as num)?.toDouble(),
    tempMax: (json['temp_max'] as num)?.toDouble(),
    feelsLike: (json['feels_like'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'feels_like': instance.feelsLike,
    };

Wind _$WindFromJson(Map<String, dynamic> json) {
  return Wind(
    mpsSpeed: (json['speed'] as num)?.toDouble(),
    deg: (json['deg'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.mpsSpeed,
      'deg': instance.deg,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };
