part of 'weather.dart';

@JsonSerializable()
class AtmosphericData {
  final int pressure, humidity, clouds;
  final String description;

  const AtmosphericData({
    this.pressure,
    this.humidity,
    this.clouds,
    this.description,
  });

  factory AtmosphericData.fromJson(Map<String, dynamic> json) =>
      _$AtmosphericDataFromJson(json);

  Map<String, dynamic> toJson() => _$AtmosphericDataToJson(this);

  @override
  String toString() =>
      'AtmosphericData{pressure: $pressure, humidity: $humidity, '
      'clouds: $clouds, description: $description}';
}
