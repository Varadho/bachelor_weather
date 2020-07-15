abstract class WeatherAction {}

class LoadCurrentWeatherAction extends WeatherAction {
  final String location;
  LoadCurrentWeatherAction(this.location);
}

class Load3DayForecastAction extends WeatherAction {
  final String location;
  Load3DayForecastAction(this.location);
}
