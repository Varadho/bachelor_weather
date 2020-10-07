import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state_management/providers/weather_notifier.dart';
import '../../../utility/constants/colors.dart';
import '../../../utility/repository.dart';
import '../../common_widgets/controls/location_selector.dart';
import '../../common_widgets/controls/time_selector.dart';
import '../../common_widgets/displays/atmospheric_display.dart';
import '../../common_widgets/displays/location_display.dart';
import '../../common_widgets/displays/sun_time_display.dart';
import '../../common_widgets/displays/temperature_display.dart';
import '../../common_widgets/displays/wind_display.dart';

class ProviderPageSmall extends StatelessWidget {
  const ProviderPageSmall({Key key}) : super(key: key);

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
                    earliest: WeatherRepository().forecast.first.time,
                    latest: WeatherRepository().forecast.last.time,
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
