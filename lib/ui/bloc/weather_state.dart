part of 'weather_bloc.dart';

abstract class WeatherState {
  get nextState => null;

  Future<void> performAction(WeatherBloc weatherBloc) async {}
}
