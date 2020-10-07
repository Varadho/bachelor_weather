part of 'weather_state.dart';

@JsonSerializable()
class LocationData {
  final String name;
  @JsonKey(name: "id")
  final int cityID;
  final Coordinates coord;
  final String country;
  final DateTime sunrise, sunset;

  LocationData({
    this.coord = const Coordinates(),
    this.country = "Nothing",
    this.name = "Nowhere",
    this.cityID = -1,
    int sunrise = 0,
    int sunset = 0,
    int timezone = 0,
  })  : sunrise =
            DateTime.fromMillisecondsSinceEpoch(sunrise * 1000, isUtc: true) -
                timezone.seconds,
        sunset =
            DateTime.fromMillisecondsSinceEpoch(sunset * 1000, isUtc: true) -
                timezone.seconds;

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);

  @override
  String toString() => "$name, $country";

  String get cityName => name.split(" ").last;
}
