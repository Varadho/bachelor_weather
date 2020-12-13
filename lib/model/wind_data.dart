part of 'weather_state.dart';

///Information about the wind
@JsonSerializable()
class WindData extends Equatable {
  ///Wind speed in meter per second
  @JsonKey(name: 'speed')
  final double mpsSpeed;

  ///Wind direction in degrees, 0 being North, 90 east, 180 south and 270 west
  final double deg;

  @override
  String toString() => 'Wind{speed: $mpsSpeed, deg: $deg}';

  // ignore: public_member_api_docs
  const WindData({
    this.mpsSpeed = 0,
    this.deg = 0,
  });

  ///Factory which allows deserialization of a JSON-Map into a
  ///[WindData] object
  factory WindData.fromJson(Map<String, dynamic> json) =>
      _$WindDataFromJson(json);

  ///Method which allows serialization of the [LocationData] into a JSON-Map
  Map<String, dynamic> toJson() => _$WindDataToJson(this);

  @override
  List<Object> get props => [mpsSpeed, deg];
}
