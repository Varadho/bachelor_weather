import 'package:flutter/material.dart';

import '../../../model/weather_state.dart';
import '../../../utility/constants/colors.dart';
import '../../../utility/weather_repository.dart';
import 'controls/weather_controls.dart';
import 'displays/weather_displays.dart';

///Page which displays the weather using no state management package
class SSPage extends StatefulWidget {
  // ignore: public_member_api_docs
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
                currentTime: currentWeather.time,
                onIncrementTime: () => setState(() {
                  currentWeather = wr.incrementTime();
                }),
                onDecrementTime: () => setState(() {
                  currentWeather = wr.decrementTime();
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
