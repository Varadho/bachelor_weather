import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../model/weather_state.dart';
import '../../../utility/constants/colors.dart';
import '../../../utility/weather_repository.dart';
import 'controls/weather_controls.dart';
import 'displays/weather_displays.dart';
import 'state_management/reducer.dart';

///Page which displays the weather using the Redux package for state management
class ReduxPage extends StatelessWidget {
  // ignore: public_member_api_docs
  const ReduxPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreProvider<WeatherState>(
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
                  LocationDisplay(),
                  SunTimeDisplay(),
                  TemperatureDisplay(),
                  WindDisplay(),
                  AtmosphericDisplay(),
                  Container(),
                ],
              ),
              //Time & Location controls
              Align(
                alignment: Alignment.bottomLeft,
                child: TimeSelector(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: LocationSelector(),
              ),
            ],
          ),
        ),
      );
}
