class Weather {
  Coordinates coordinates;
  Description description;
  double temperature, tempMin, tempMax;
  int pressure;
  int humidity;
  int visibility;
  Wind wind;
  int clouds;
  int sunrise, sunset;
}

class Wind {
  final double speed;
  final int deg;

  Wind(this.speed, this.deg);
}

class Description {
  final String main;
  final String detailed;

  Description(this.main, this.detailed);
}

class Coordinates {
  final double lat, lon;
  Coordinates(this.lat, this.lon);
}
