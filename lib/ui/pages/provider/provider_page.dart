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
