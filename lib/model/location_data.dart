part of 'weather.dart';

@JsonSerializable()
class LocationData {
  final String cityName;
  final int cityID;
  final Coordinates coordinates;
  final String country;
  const LocationData({
    this.coordinates,
    this.country,
    this.cityName,
    this.cityID,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);

  @override
  String toString() => "$cityName, $country";
}
