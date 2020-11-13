import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utility/constants/colors.dart';
import '../../../utility/weather_repository.dart';
import 'controls/weather_controls.dart';
import 'displays/weather_displays.dart';
import 'state_management/weather_bloc.dart';

///Page which displays the weather using the BLoC state management package
class BlocPage extends StatelessWidget {
  // ignore: public_member_api_docs
  const BlocPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc(WeatherRepository().currentWeather),
        child: Scaffold(
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
