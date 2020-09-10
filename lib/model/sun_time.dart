part of 'weather.dart';

@JsonSerializable()
class SunTime {
  final DateTime sunrise, sunset;
  final DateTime time;
  final int _timezone;

  SunTime({int sunrise, int sunset, int time, int timezone})
      : time = DateTime.fromMillisecondsSinceEpoch(time),
        sunrise = DateTime.fromMillisecondsSinceEpoch(sunrise),
        sunset = DateTime.fromMillisecondsSinceEpoch(sunset),
        _timezone = timezone;

  factory SunTime.fromJson(Map<String, dynamic> json) =>
      _$SunTimeFromJson(json);

  Map<String, dynamic> toJson() => _$SunTimeToJson(this);

  int get timezone => _timezone;
}
