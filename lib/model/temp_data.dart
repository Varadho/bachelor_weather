part of 'weather_state.dart';

///Information about the temperature
@JsonSerializable()
class TemperatureData extends Equatable {
  ///Average Temperature
  @JsonKey(name: 'temp')
  final double avg;
  ///Minimum Temperature for the Day
  @JsonKey(name: 'temp_min')
  final double min;
  ///Maximum Temperature for the day
  @JsonKey(name: 'temp_max')
  final double max;
  ///What the average temperature feels like
  @JsonKey(name: 'feels_like')
  final double feelsLike;

  // ignore: public_member_api_docs
  const TemperatureData({
    this.avg = 0,
    this.min = 0,
    this.max = 0,
    this.feelsLike = 0,
  });

  ///Factory which allows for deserializing a JSON-Map into a
  ///[TemperatureData] Object
  factory TemperatureData.fromJson(Map<String, dynamic> json) =>
      _$TemperatureDataFromJson(json);

  ///Method which allows serializing the [TemperatureData] into a JSON-Map
  Map<String, dynamic> toJson() => _$TemperatureDataToJson(this);

  @override
  String toString() => 'Info{temperature: $avg, tempMin: $min, tempMax: $max, '
      'feelsLike: $feelsLike}';
  @override
  List<Object> get props => [avg, min, max, feelsLike];
}
