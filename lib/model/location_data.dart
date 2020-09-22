part of 'weather.dart';

@JsonSerializable()
class LocationData {
  @JsonKey(name: "name")
  final String cityName;
  @JsonKey(name: "id")
  final int cityID;
  final Coordinates coord;
  final String country;
  final DateTime sunrise, sunset;

  LocationData({
    this.coord = const Coordinates(),
    this.country = "Nothing",
    this.cityName = "Nowhere",
    this.cityID = -1,
    int sunrise = 0,
    int sunset = 0,
    int timezone = 0,
  })  : sunrise =
            DateTime.fromMillisecondsSinceEpoch(sunrise * 1000, isUtc: true) +
                timezone.seconds,
        sunset =
            DateTime.fromMillisecondsSinceEpoch(sunset * 1000, isUtc: true) +
                timezone.seconds;

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);

  @override
  String toString() => "$cityName, $country";
}
