import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/weather_state.dart';
import '../../../state_management/bloc/weather_bloc.dart';
import '../../../utility/constants/colors.dart';
import '../../../utility/repository.dart';
import '../../common_widgets/controls/location_selector.dart';
import '../../common_widgets/controls/time_selector.dart';
import '../../common_widgets/displays/atmospheric_display.dart';
import '../../common_widgets/displays/location_display.dart';
import '../../common_widgets/displays/sun_time_display.dart';
import '../../common_widgets/displays/temperature_display.dart';
import '../../common_widgets/displays/wind_display.dart';

class BlocPageBig extends StatelessWidget {
  const BlocPageBig({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => WeatherBloc(WeatherRepository().currentWeather),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) => Scaffold(
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
                    LocationDisplay(state.location),
                    SunTimeDisplay(
                      state.location.sunrise,
                      state.location.sunset,
                    ),
                    TemperatureDisplay(state.temperature),
                    WindDisplay(state.wind),
                    AtmosphericDisplay(state.atmosphere),
                    Container(),
                  ],
                ),
                //Time & Location controls
                Align(
                  alignment: Alignment.bottomLeft,
                  child: BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) => TimeSelector(
                      initialTime: state.time,
                      onTimeSelected: (time) =>
                          BlocProvider.of<WeatherBloc>(context).add(
                        TimeChangedEvent(time),
                      ),
                      earliest: WeatherRepository().forecast.first.time,
                      latest: WeatherRepository().forecast.last.time,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) => LocationSelector(
                      initialLocation: state.location,
                      onLocationSelected: (location) =>
                          BlocProvider.of<WeatherBloc>(context).add(
                        LocationChangedEvent(location),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
