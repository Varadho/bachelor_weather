part of 'weather_state.dart';

///Information about the atmosphere
@JsonSerializable()
class AtmosphericData extends Equatable {
  ///Pressure is measured in hPa and humidity in percent
  final int pressure, humidity;
  ///a percentage of cloudiness
  @JsonKey(name: "all")
  final int clouds;
  ///a short description of current atmospheric data
  final String description;

  // ignore: public_member_api_docs
  const AtmosphericData({
    this.pressure = 0,
    this.humidity = 0,
    this.clouds = 0,
    this.description = "nothing",
  });

  ///Factory which allows for deserializing a JSON-Map into an
  ///[AtmosphericData] Object
  factory AtmosphericData.fromJson(Map<String, dynamic> json) =>
      _$AtmosphericDataFromJson(json);

  ///Method which allows serializing the [AtmosphericData] into a JSON-Map
  Map<String, dynamic> toJson() => _$AtmosphericDataToJson(this);

  @override
  String toString() =>
      'AtmosphericData{pressure: $pressure, humidity: $humidity, '
      'clouds: $clouds, description: $description}';

  @override
  List<Object> get props => [pressure, humidity, clouds, description];
}
