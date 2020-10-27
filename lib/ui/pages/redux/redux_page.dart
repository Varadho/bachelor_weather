import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../model/weather_state.dart';
import '../../../state_management/redux/actions.dart';
import '../../../state_management/redux/reducer.dart';
import '../../../utility/constants/colors.dart';
import '../../../utility/weather_repository.dart';
import '../../common_widgets/controls/weather_controls.dart';
import '../../common_widgets/displays/weather_displays.dart';

class ReduxPage extends StatelessWidget {
  const ReduxPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreProvider(
        store: Store<WeatherState>(
          weatherReducer,
          initialState: WeatherRepository().currentWeather,
        ),
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: Stack(
            children: [
              //Background Color
              Container(
                decoration: BoxDecoration(gradient: backgroundGradient),
              ),
              //Weather Displays
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StoreConnector<WeatherState, LocationData>(
                    converter: (store) => store.state.location,
                    builder: (context, location) => LocationDisplay(location),
                  ),
                  StoreConnector<WeatherState, LocationData>(
                    converter: (store) => store.state.location,
                    builder: (context, location) => SunTimeDisplay(
                      location.sunrise,
                      location.sunset,
                    ),
                  ),
                  StoreConnector<WeatherState, TemperatureData>(
                    converter: (store) => store.state.temperature,
                    builder: (context, temp) => TemperatureDisplay(temp),
                  ),
                  StoreConnector<WeatherState, WindData>(
                    converter: (store) => store.state.wind,
                    builder: (context, wind) => WindDisplay(wind),
                  ),
                  StoreConnector<WeatherState, AtmosphericData>(
                    converter: (store) => store.state.atmosphere,
                    builder: (context, atm) => AtmosphericDisplay(atm),
                  ),
                  Container(),
                ],
              ),
              //Time & Location controls
              Align(
                alignment: Alignment.bottomLeft,
                child: StoreConnector<WeatherState, DateTime>(
                  converter: (store) => store.state.time,
                  builder: (context, time) => TimeSelector(
                      initialTime: time,
                      onTimeSelected: (time) =>
                          StoreProvider.of<WeatherState>(context).dispatch(
                            ChangeTimeAction(time),
                          )),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: StoreConnector<WeatherState, LocationData>(
                  converter: (store) => store.state.location,
                  builder: (context, location) => LocationSelector(
                      initialLocation: location,
                      onLocationSelected: (location) =>
                          StoreProvider.of<WeatherState>(context).dispatch(
                            ChangeLocationAction(location),
                          )),
                ),
              ),
            ],
          ),
        ),
      );
}
