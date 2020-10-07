part of 'weather_state.dart';

@JsonSerializable()
class AtmosphericData extends Equatable {
  final int pressure, humidity;
  @JsonKey(name: "all")
  final int clouds;
  final String description;

  const AtmosphericData({
    this.pressure = 0,
    this.humidity = 0,
    this.clouds = 0,
    this.description = "nothing",
  });

  factory AtmosphericData.fromJson(Map<String, dynamic> json) =>
      _$AtmosphericDataFromJson(json);

  Map<String, dynamic> toJson() => _$AtmosphericDataToJson(this);

  @override
  String toString() =>
      'AtmosphericData{pressure: $pressure, humidity: $humidity, '
      'clouds: $clouds, description: $description}';

  @override
  List<Object> get props => [pressure, humidity, clouds, description];
}
