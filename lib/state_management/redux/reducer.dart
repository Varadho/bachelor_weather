import 'package:redux/redux.dart';

import '../../model/weather_state.dart';
import '../../utility/weather_repository.dart';
import 'actions.dart';

typedef WeatherReducer = Function(WeatherState, WeatherAction);

///Reducer for all WeatherActions
final WeatherReducer weatherReducer = combineReducers<WeatherState>(
  [
    TypedReducer<WeatherState, ChangeTimeAction>(
      (_, action) => WeatherRepository().changeTime(action.newTime),
    ),
    TypedReducer<WeatherState, ChangeLocationAction>(
      (_, action) => WeatherRepository().changeLocation(action.newLocation),
    ),
  ],
);
