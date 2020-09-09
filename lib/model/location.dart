import 'weather.dart';

class Location {
  final String cityName;
  final int cityID;
  final Coordinates coordinates;
  final String country;
  const Location({
    this.coordinates,
    this.country,
    this.cityName,
    this.cityID,
  });

  @override
  String toString() => "$cityName, $country";
}
