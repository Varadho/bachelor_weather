part of 'weather_state.dart';

///Information about the coordinates for the current Weather
@JsonSerializable()
class Coordinates extends Equatable {
  ///Latitude and Longitude
  final double lat, lon;
  @override
  String toString() => 'Coordinates{lat: $lat, lon: $lon}';

  // ignore: public_member_api_docs
  const Coordinates({this.lat = 0, this.lon = 0});

  ///Factory which allows for deserializing a JSON-Map into a
  ///[Coordinates] Object
  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  ///Method which allows serializing the [Coordinates] into a JSON-Map
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
  @override
  List<Object> get props => [lat, lon];
}
