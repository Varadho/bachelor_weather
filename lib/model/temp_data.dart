part of 'weather_state.dart';

@JsonSerializable()
class TemperatureData {
  @JsonKey(name: 'temp')
  final double avg;
  @JsonKey(name: 'temp_min')
  final double min;
  @JsonKey(name: 'temp_max')
  final double max;
  @JsonKey(name: 'feels_like')
  final double feelsLike;

  TemperatureData({
    this.avg = 0,
    this.min = 0,
    this.max = 0,
    this.feelsLike = 0,
  });

  factory TemperatureData.fromJson(Map<String, dynamic> json) =>
      _$TemperatureDataFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureDataToJson(this);

  @override
  String toString() => 'Info{temperature: $avg, tempMin: $min, tempMax: $max, '
      'feelsLike: $feelsLike}';
}
