import 'package:bachelorweather/model/weather.dart';

class Location {
  final String cityName;
  final int cityID;
  final Coordinates coordinates;
  final String country;
  Location({
    this.coordinates,
    this.country,
    this.cityName,
    this.cityID,
  });
}
