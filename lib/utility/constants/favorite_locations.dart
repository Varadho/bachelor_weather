import '../../model/location.dart';
import '../../model/weather.dart';

const Location hh = Location(
  cityID: 6547395,
  cityName: "Hamburg",
  country: "DE",
  coordinates: Coordinates(
    lon: 10.0,
    lat: 53.549999,
  ),
);

const Location giessen = Location(
  cityID: 2920512,
  cityName: "Gießen",
  country: "DE",
  coordinates: Coordinates(
    lon: 8.65,
    lat: 50.583328,
  ),
);

const Location koeln = Location(
  cityID: 2920512,
  cityName: "Köln",
  country: "DE",
  coordinates: Coordinates(
    lon: 8.65,
    lat: 50.583328,
  ),
);

const List<Location> favoriteLocations = <Location>[hh, giessen, koeln];
