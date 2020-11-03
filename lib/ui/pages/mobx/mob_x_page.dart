import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
          body: Builder(
            builder: (context) {
              var _weatherStore = Provider.of<WeatherStore>(context);
              return Stack(
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
                      Observer(
                        builder: (_) =>
                            LocationDisplay(_weatherStore.state.location),
                      ),
                      Observer(
                        builder: (_) => SunTimeDisplay(
                          _weatherStore.state.location.sunrise,
                          _weatherStore.state.location.sunset,
                        ),
                      ),
                      Observer(
                          builder: (_) => TemperatureDisplay(
                              _weatherStore.state.temperature)),
                      Observer(
                          builder: (_) =>
                              WindDisplay(_weatherStore.state.wind)),
                      Observer(
                          builder: (_) => AtmosphericDisplay(
                              _weatherStore.state.atmosphere)),
                      Container(),
                    ],
                  ),
                  //Time & Location controls
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Observer(
                      builder: (_) => TimeSelector(
                        initialTime: _weatherStore.state.time,
                        onTimeSelected: (time) =>
                            _weatherStore.changeTime(time),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Observer(
                      builder: (_) => LocationSelector(
                        initialLocation: _weatherStore.state.location,
                        onLocationSelected: (location) =>
                            _weatherStore.changeLocation(location),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
}
