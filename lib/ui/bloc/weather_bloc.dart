import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherState, WeatherEvent> {
  WeatherBloc(initialState) : super(initialState);

  @override
  Stream<WeatherEvent> mapEventToState(WeatherState event) async* {
    yield event.nextState;
    event.performAction(this);
  }
}
