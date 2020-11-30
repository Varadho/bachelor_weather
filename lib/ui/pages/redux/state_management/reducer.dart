import 'package:redux/redux.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/weather_repository.dart';
import 'actions.dart';

///Type definition for weather reducers. These functions take a [WeatherState]
/// and [WeatherAction] as parameters
typedef WeatherReducer = WeatherState Function(WeatherState, WeatherAction);

///Reducer for all WeatherActions
final WeatherReducer weatherReducer = combineReducers<WeatherState>(
  [
    TypedReducer<WeatherState, IncrementTimeAction>(
      (_, action) => WeatherRepository().incrementTime(),
    ),
    TypedReducer<WeatherState, DecrementTimeAction>(
      (_, action) => WeatherRepository().decrementTime(),
    ),
    TypedReducer<WeatherState, ChangeLocationAction>(
      (_, action) => WeatherRepository().changeLocation(action.newLocation),
    ),
  ],
);
