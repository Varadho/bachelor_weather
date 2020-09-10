// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    atmosphere: json['atmosphere'] == null
        ? null
        : AtmosphericData.fromJson(json['atmosphere'] as Map<String, dynamic>),
    coords: json['coords'] == null
        ? null
        : Coordinates.fromJson(json['coords'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : LocationData.fromJson(json['location'] as Map<String, dynamic>),
    temperature: json['temperature'] == null
        ? null
        : TemperatureData.fromJson(json['temperature'] as Map<String, dynamic>),
    wind: json['wind'] == null
        ? null
        : WindData.fromJson(json['wind'] as Map<String, dynamic>),
    time: json['time'] as int,
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'atmosphere': instance.atmosphere?.toJson(),
      'coords': instance.coords?.toJson(),
      'location': instance.location?.toJson(),
      'temperature': instance.temperature?.toJson(),
      'wind': instance.wind?.toJson(),
      'sunrise': instance.sunrise?.toIso8601String(),
      'sunset': instance.sunset?.toIso8601String(),
      'time': instance.time?.toIso8601String(),
    };

AtmosphericData _$AtmosphericDataFromJson(Map<String, dynamic> json) {
  return AtmosphericData(
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
    clouds: json['clouds'] as int,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$AtmosphericDataToJson(AtmosphericData instance) =>
    <String, dynamic>{
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'clouds': instance.clouds,
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
    coordinates: json['coordinates'] == null
        ? null
        : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    country: json['country'] as String,
    cityName: json['cityName'] as String,
    cityID: json['cityID'] as int,
  );
}

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'cityID': instance.cityID,
      'coordinates': instance.coordinates,
      'country': instance.country,
    };

SunTime _$SunTimeFromJson(Map<String, dynamic> json) {
  return SunTime(
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
    time: json['time'] as int,
    timezone: json['timezone'] as int,
  );
}

Map<String, dynamic> _$SunTimeToJson(SunTime instance) => <String, dynamic>{
      'sunrise': instance.sunrise?.toIso8601String(),
      'sunset': instance.sunset?.toIso8601String(),
      'time': instance.time?.toIso8601String(),
      'timezone': instance.timezone,
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
