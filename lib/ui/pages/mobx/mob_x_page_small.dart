import 'package:flutter/material.dart';

import '../../../model/weather_state.dart';
import '../../../utility/constants/colors.dart';
import '../../../utility/repository.dart';
import '../../common_widgets/controls/location_selector.dart';
import '../../common_widgets/controls/time_selector.dart';
import '../../common_widgets/displays/atmospheric_display.dart';
import '../../common_widgets/displays/location_display.dart';
import '../../common_widgets/displays/sun_time_display.dart';
import '../../common_widgets/displays/temperature_display.dart';
import '../../common_widgets/displays/wind_display.dart';

class MobXPageSmall extends StatefulWidget {
  const MobXPageSmall({Key key}) : super(key: key);
  @override
  _MobXPageSmallState createState() => _MobXPageSmallState();
}

class _MobXPageSmallState extends State<MobXPageSmall> {
  WeatherRepository wr = WeatherRepository();
  WeatherState currentWeather;

  @override
  void initState() {
    currentWeather = wr.currentWeather;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                LocationDisplay(currentWeather.location),
                SunTimeDisplay(
                  currentWeather.location.sunrise,
                  currentWeather.location.sunset,
                ),
                TemperatureDisplay(currentWeather.temperature),
                WindDisplay(currentWeather.wind),
                AtmosphericDisplay(currentWeather.atmosphere),
                Container(),
              ],
            ),
            //Time & Location controls
            Align(
              alignment: Alignment.bottomLeft,
              child: TimeSelector(
                initialTime: currentWeather.time,
                onTimeSelected: (time) => setState(() {
                  currentWeather = wr.changeTime(time);
                }),
                earliest: wr.forecast.first.time,
                latest: wr.forecast.last.time,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: LocationSelector(
                onLocationSelected: (location) => setState(
                  () {
                    currentWeather = wr.changeLocation(location);
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
