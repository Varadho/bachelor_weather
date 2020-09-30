import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(initialState) : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    yield event.nextState;
    event.performAction(this);
  }
}
