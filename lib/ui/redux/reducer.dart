import 'package:redux/redux.dart';

import '../../model/weather.dart';
import 'actions.dart';

typedef WeatherReducer = Function(Weather, WeatherAction);

///Reducer for all WeatherActions
final WeatherReducer weatherReducer = combineReducers<Weather>(
  [
    TypedReducer<Weather, LoadCurrentWeatherAction>(_loadCurrentWeather),
    TypedReducer<Weather, Load3DayForecastAction>(_load3DayForecast),
  ],
);

Weather _loadCurrentWeather(Weather state, LoadCurrentWeatherAction action) {
  Weather w;
  return w;
}

Weather _load3DayForecast(Weather state, Load3DayForecastAction action) {
  Weather w;
  return w;
}
