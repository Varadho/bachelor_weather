import '../../model/weather.dart';

const LocationData hh = LocationData(
  cityID: 6547395,
  cityName: "Hamburg",
  country: "DE",
  coordinates: Coordinates(
    lon: 10.0,
    lat: 53.549999,
  ),
);

const LocationData giessen = LocationData(
  cityID: 2920512,
  cityName: "Gießen",
  country: "DE",
  coordinates: Coordinates(
    lon: 8.65,
    lat: 50.583328,
  ),
);

const LocationData koeln = LocationData(
  cityID: 2920512,
  cityName: "Köln",
  country: "DE",
  coordinates: Coordinates(
    lon: 8.65,
    lat: 50.583328,
  ),
);

const LocationData london = LocationData(
  cityID: 2643743,
  cityName: "London",
  country: "GB",
  coordinates: Coordinates(
    lon: -0.12574,
    lat: 51.50853,
  ),
);

const LocationData marseille = LocationData(
  cityID: 2995469,
  cityName: "Marseille",
  country: "FR",
  coordinates: Coordinates(
    lon: 5.38107,
    lat: 43.296951,
  ),
);

const LocationData tokyo = LocationData(
  cityID: 1850147,
  cityName: "Tokyo",
  country: "JP",
  coordinates: Coordinates(
    lon: 139.691711,
    lat: 35.689499,
  ),
);

const LocationData kapstadt = LocationData(
  cityID: 3369157,
  cityName: "Cape Town",
  country: "ZA",
  coordinates: Coordinates(
    lon: 18.42322,
    lat: -33.925838,
  ),
);

const List<LocationData> favoriteLocations = <LocationData>[
  giessen,
  koeln,
  hh,
  marseille,
  tokyo,
  london,
  kapstadt,
];
