import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utility/constants/colors.dart';
import 'controls/weather_controls.dart';
import 'displays/weather_displays.dart';
import 'state_management/weather_notifier.dart';

///Page which displays the weather using the Provider package to realize
///state management
class ProviderPage extends StatelessWidget {
  // ignore: public_member_api_docs
  const ProviderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => WeatherNotifier(),
        builder: (context, child) => Scaffold(
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
                  Consumer<WeatherNotifier>(
                    builder: (context, notifier, _) =>
                        LocationDisplay(notifier.weather.location),
                  ),
                  Consumer<WeatherNotifier>(
                    builder: (context, notifier, _) => SunTimeDisplay(
                      notifier.weather.location.sunrise,
                      notifier.weather.location.sunset,
                    ),
                  ),
                  Consumer<WeatherNotifier>(
                    builder: (context, notifier, _) =>
                        TemperatureDisplay(notifier.weather.temperature),
                  ),
                  Consumer<WeatherNotifier>(
                    builder: (context, notifier, _) =>
                        WindDisplay(notifier.weather.wind),
                  ),
                  Consumer<WeatherNotifier>(
                    builder: (context, notifier, _) =>
                        AtmosphericDisplay(notifier.weather.atmosphere),
                  ),
                  Container(),
                ],
              ),
              //Time & Location controls
              Align(
                alignment: Alignment.bottomLeft,
                child: Consumer<WeatherNotifier>(
                  builder: (context, notifier, _) => TimeSelector(
                    initialTime: notifier.weather.time,
                    onTimeSelected: (time) => notifier.changeTime(time),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Consumer<WeatherNotifier>(
                  builder: (context, notifier, _) => LocationSelector(
                    onLocationSelected: (location) =>
                        notifier.changeLocation(location),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
