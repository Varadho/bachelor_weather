import '../../model/weather_state.dart';

LocationData hh = LocationData(
  cityID: 6547395,
  name: "Hamburg",
  country: "DE",
  coord: Coordinates(
    lon: 10.0,
    lat: 53.549999,
  ),
);

LocationData giessen = LocationData(
  cityID: 2920512,
  name: "Gießen",
  country: "DE",
  coord: Coordinates(
    lon: 8.65,
    lat: 50.583328,
  ),
);

LocationData koeln = LocationData(
  cityID: 2920512,
  name: "Köln",
  country: "DE",
  coord: Coordinates(
    lon: 8.65,
    lat: 50.583328,
  ),
);

LocationData london = LocationData(
  cityID: 2643743,
  name: "London",
  country: "GB",
  coord: Coordinates(
    lon: -0.12574,
    lat: 51.50853,
  ),
);

LocationData marseille = LocationData(
  cityID: 2995469,
  name: "Marseille",
  country: "FR",
  coord: Coordinates(
    lon: 5.38107,
    lat: 43.296951,
  ),
);

LocationData tokyo = LocationData(
  cityID: 1850147,
  name: "Tokyo",
  country: "JP",
  coord: Coordinates(
    lon: 139.691711,
    lat: 35.689499,
  ),
);

LocationData kapstadt = LocationData(
  cityID: 3369157,
  name: "Cape Town",
  country: "ZA",
  coord: Coordinates(
    lon: 18.42322,
    lat: -33.925838,
  ),
);

List<LocationData> favoriteLocations = <LocationData>[
  giessen,
  koeln,
  hh,
  marseille,
  tokyo,
  london,
];
