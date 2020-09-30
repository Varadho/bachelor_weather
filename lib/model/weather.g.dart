// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AtmosphericData _$AtmosphericDataFromJson(Map<String, dynamic> json) {
  return AtmosphericData(
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
    clouds: json['all'] as int,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$AtmosphericDataToJson(AtmosphericData instance) =>
    <String, dynamic>{
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'all': instance.clouds,
      'description': instance.description,
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

LocationData _$LocationDataFromJson(Map<String, dynamic> json) {
  return LocationData(
    coord: json['coord'] == null
        ? null
        : Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
    country: json['country'] as String,
    name: json['name'] as String,
    cityID: json['id'] as int,
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
  );
}

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.cityID,
      'coord': instance.coord,
      'country': instance.country,
      'sunrise': instance.sunrise?.toIso8601String(),
      'sunset': instance.sunset?.toIso8601String(),
    };

TemperatureData _$TemperatureDataFromJson(Map<String, dynamic> json) {
  return TemperatureData(
    avg: (json['temp'] as num)?.toDouble(),
    min: (json['temp_min'] as num)?.toDouble(),
    max: (json['temp_max'] as num)?.toDouble(),
    feelsLike: (json['feels_like'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TemperatureDataToJson(TemperatureData instance) =>
    <String, dynamic>{
      'temp': instance.avg,
      'temp_min': instance.min,
      'temp_max': instance.max,
      'feels_like': instance.feelsLike,
    };

WindData _$WindDataFromJson(Map<String, dynamic> json) {
  return WindData(
    mpsSpeed: (json['speed'] as num)?.toDouble(),
    deg: (json['deg'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WindDataToJson(WindData instance) => <String, dynamic>{
      'speed': instance.mpsSpeed,
      'deg': instance.deg,
    };
