import 'package:redux/redux.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/weather_repository.dart';
import 'actions.dart';

///Type definition for weather reducers. These functions take a [WeatherState]
/// and [WeatherAction] as parameters
typedef WeatherReducer = Function(WeatherState, WeatherAction);

WeatherRepository _wr = WeatherRepository();

///Reducer for all WeatherActions
final WeatherReducer weatherReducer = combineReducers<WeatherState>(
  [
    TypedReducer<WeatherState, IncrementTimeAction>(
      (_, action) => _wr.incrementTime(),
    ),
    TypedReducer<WeatherState, DecrementTimeAction>(
      (_, action) => _wr.decrementTime(),
    ),
    TypedReducer<WeatherState, ChangeLocationAction>(
      (_, action) => _wr.changeLocation(action.newLocation),
    ),
  ],
);
