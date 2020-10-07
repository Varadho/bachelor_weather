import 'package:redux/redux.dart';

import '../../model/weather_state.dart';
import 'actions.dart';

typedef WeatherReducer = Function(WeatherState, WeatherAction);

///Reducer for all WeatherActions
final WeatherReducer weatherReducer = combineReducers<WeatherState>(
  [
    TypedReducer<WeatherState, LoadCurrentWeatherAction>(_loadCurrentWeather),
    TypedReducer<WeatherState, Load3DayForecastAction>(_load3DayForecast),
  ],
);

WeatherState _loadCurrentWeather(
    WeatherState state, LoadCurrentWeatherAction action) {
  WeatherState w;
  return w;
}

WeatherState _load3DayForecast(
    WeatherState state, Load3DayForecastAction action) {
  WeatherState w;
  return w;
}
