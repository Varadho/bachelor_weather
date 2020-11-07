import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/weather_repository.dart';

part 'weather_event.dart';

///The business logic component which is responsible for handling state in the
///BLoC implementation of the UI
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _wr = WeatherRepository();

  // ignore: public_member_api_docs
  WeatherBloc(initialState) : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    switch (event.runtimeType) {
      case IncrementTimeEvent:
        yield _wr.incrementTime();
        break;
      case DecrementTimeEvent:
        yield _wr.decrementTime();
        break;
      case LocationChangedEvent:
        yield _wr.changeLocation((event as LocationChangedEvent).newLocation);
        break;
    }
  }
}
