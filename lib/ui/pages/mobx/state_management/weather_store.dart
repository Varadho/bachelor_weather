import 'package:mobx/mobx.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/weather_repository.dart';

part 'weather_store.g.dart';

///WeatherStore which is used to hold all possible States one might want to
///display
class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore with Store {
  static final WeatherRepository _weatherRepository = WeatherRepository();

  @observable
  WeatherState state = _weatherRepository.currentWeather;

  @action
  void incrementTime() {
    state = _weatherRepository.incrementTime();
  }

  @action
  void decrementTime() {
    state = _weatherRepository.decrementTime();
  }

  @action
  void changeLocation(LocationData newLocation) {
    state = _weatherRepository.changeLocation(newLocation);
  }

  @override
  String toString() => '_WeatherStore{wr: $_weatherRepository, state: $state}';
}
