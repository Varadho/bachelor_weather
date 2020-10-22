import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../state_management/mob_x/weather_store.dart';
import '../../../utility/constants/colors.dart';
import '../../common_widgets/controls/location_selector.dart';
import '../../common_widgets/controls/time_selector.dart';
import '../../common_widgets/displays/atmospheric_display.dart';
import '../../common_widgets/displays/location_display.dart';
import '../../common_widgets/displays/sun_time_display.dart';
import '../../common_widgets/displays/temperature_display.dart';
import '../../common_widgets/displays/wind_display.dart';

class MobXPage extends StatelessWidget {
  MobXPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _weatherStore = Provider.of<WeatherStore>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              Observer(
                builder: (_) => LocationDisplay(_weatherStore.state.location),
              ),
              Observer(
                builder: (_) => SunTimeDisplay(
                  _weatherStore.state.location.sunrise,
                  _weatherStore.state.location.sunset,
                ),
              ),
              Observer(
                  builder: (_) =>
                      TemperatureDisplay(_weatherStore.state.temperature)),
              Observer(builder: (_) => WindDisplay(_weatherStore.state.wind)),
              Observer(
                  builder: (_) =>
                      AtmosphericDisplay(_weatherStore.state.atmosphere)),
              Container(),
            ],
          ),
          //Time & Location controls
          Align(
            alignment: Alignment.bottomLeft,
            child: Observer(
              builder: (_) => TimeSelector(
                initialTime: _weatherStore.state.time,
                onTimeSelected: (time) => _weatherStore.changeTime(time),
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
      ),
    );
  }
}
