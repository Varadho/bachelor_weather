import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utility/constants/colors.dart';
import 'controls/weather_controls.dart';
import 'displays/weather_displays.dart';
import 'state_management/weather_store.dart';

///Page which displays the weather using the MobX state management package
class MobXPage extends StatelessWidget {
  // ignore: public_member_api_docs
  MobXPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Provider(
        create: (context) => WeatherStore(),
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
