// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherStore, Store {
  final _$stateAtom = Atom(name: '_WeatherStore.state');

  @override
  WeatherState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(WeatherState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_WeatherStoreActionController =
      ActionController(name: '_WeatherStore');

  @override
  void changeTime(DateTime newTime) {
    final _$actionInfo = _$_WeatherStoreActionController.startAction(
        name: '_WeatherStore.changeTime');
    try {
      return super.changeTime(newTime);
    } finally {
      _$_WeatherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLocation(LocationData newLocation) {
    final _$actionInfo = _$_WeatherStoreActionController.startAction(
        name: '_WeatherStore.changeLocation');
    try {
      return super.changeLocation(newLocation);
    } finally {
      _$_WeatherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
