import 'package:flutter/material.dart';

import '../../../model/weather_state.dart';
import '../../../utility/constants/colors.dart';
import '../../../utility/weather_repository.dart';
import '../../common_widgets/controls/weather_controls.dart';
import '../../common_widgets/displays/weather_displays.dart';

class SSPage extends StatefulWidget {
  const SSPage({Key key}) : super(key: key);
  @override
  _SSPageState createState() => _SSPageState();
}

class _SSPageState extends State<SSPage> {
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
