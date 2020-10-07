part of 'weather_state.dart';

@JsonSerializable()
class Coordinates {
  final double lat, lon;
  @override
  String toString() => 'Coordinates{lat: $lat, lon: $lon}';

  const Coordinates({this.lat = 0, this.lon = 0});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
