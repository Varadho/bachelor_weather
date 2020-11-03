import '../../model/weather_state.dart';

///Static location of Hamburg, Germany
LocationData hh = LocationData(
  cityID: 6547395,
  name: "Hamburg",
  country: "DE",
  coord: Coordinates(
    lon: 10.0,
    lat: 53.549999,
  ),
);

///Static location of Gießen, Germany
LocationData giessen = LocationData(
  cityID: 2920512,
  name: "Gießen",
  country: "DE",
  coord: Coordinates(
    lon: 8.65,
    lat: 50.583328,
  ),
);

///Static location of Cologne, Germany
LocationData koeln = LocationData(
  cityID: 2920512,
  name: "Köln",
  country: "DE",
  coord: Coordinates(
    lon: 8.65,
    lat: 50.583328,
  ),
);

///Static location of London, England
LocationData london = LocationData(
  cityID: 2643743,
  name: "London",
  country: "GB",
  coord: Coordinates(
    lon: -0.12574,
    lat: 51.50853,
  ),
);

///Static location of Marseille, France
LocationData marseille = LocationData(
  cityID: 2995469,
  name: "Marseille",
  country: "FR",
  coord: Coordinates(
    lon: 5.38107,
    lat: 43.296951,
  ),
);

///Static location of Tokyo, Japan
LocationData tokyo = LocationData(
  cityID: 1850147,
  name: "Tokyo",
  country: "JP",
  coord: Coordinates(
    lon: 139.691711,
    lat: 35.689499,
  ),
);

///A static list of all favorite locations
List<LocationData> favoriteLocations = <LocationData>[
  giessen,
  koeln,
  hh,
  marseille,
  tokyo,
  london,
];
