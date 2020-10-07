import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/weather_state.dart';
import '../../utility/repository.dart';

part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository wr = WeatherRepository();

  WeatherBloc(initialState) : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    switch (event.runtimeType) {
      case TimeChangedEvent:
        yield wr.changeTime((event as TimeChangedEvent).newTime);
        break;
      case LocationChangedEvent:
        yield wr.changeLocation((event as LocationChangedEvent).newLocation);
        break;
    }
  }
}
