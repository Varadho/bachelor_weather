import 'package:flutter/material.dart';

import '../model/weather.dart';
import '../utility/constants/colors.dart';
import '../utility/repository.dart';
import 'common_widgets/controls/location_selector.dart';
import 'common_widgets/controls/time_selector.dart';
import 'common_widgets/displays/atmospheric_display.dart';
import 'common_widgets/displays/location_display.dart';
import 'common_widgets/displays/sun_time_display.dart';
import 'common_widgets/displays/temperature_display.dart';
import 'common_widgets/displays/wind_display.dart';

class SSPage extends StatefulWidget {
  final Animation<double> transitionAnimation;
  const SSPage({
    Key key,
    this.transitionAnimation,
  }) : super(key: key);
  @override
  _SSPageState createState() => _SSPageState();
}

class _SSPageState extends State<SSPage> with TickerProviderStateMixin {
  WeatherRepository wr = WeatherRepository();
  Weather currentWeather;

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
            Container(
              decoration: BoxDecoration(
                gradient: backgroundGradient,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SlideAnimation(
                  animation: widget.transitionAnimation,
                  slideDirection: AxisDirection.down,
                  child: LocationDisplay(currentWeather.location),
                ),
                SlideAnimation(
                  animation: widget.transitionAnimation,
                  slideDirection: AxisDirection.down,
                  child: SunTimeDisplay(
                    currentWeather.location.sunrise,
                    currentWeather.location.sunset,
                  ),
                ),
                SlideAnimation(
                  animation: widget.transitionAnimation,
                  slideDirection: AxisDirection.right,
                  child: TemperatureDisplay(currentWeather.temperature),
                ),
                SlideAnimation(
                  animation: widget.transitionAnimation,
                  slideDirection: AxisDirection.right,
                  child: WindDisplay(
                    currentWeather.wind,
                  ),
                ),
                SlideAnimation(
                  child: AtmosphericDisplay(currentWeather.atmosphere),
                  animation: widget.transitionAnimation,
                  slideDirection: AxisDirection.left,
                ),
                Container(),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SlideAnimation(
                animation: widget.transitionAnimation,
                slideDirection: AxisDirection.right,
                child: TimeSelector(
                  initialTime: currentWeather.time,
                  onTimeSelected: (time) => setState(() {
                    currentWeather = wr.changeTime(time);
                  }),
                  earliest: wr.forecast.first.time,
                  latest: wr.forecast.last.time,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SlideAnimation(
                animation: widget.transitionAnimation,
                slideDirection: AxisDirection.left,
                child: LocationSelector(
                  onLocationSelected: (location) => setState(
                    () {
                      currentWeather = wr.changeLocation(location);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class SlideAnimation extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final AxisDirection slideDirection;

  const SlideAnimation({
    Key key,
    @required this.child,
    @required this.animation,
    this.slideDirection = AxisDirection.left,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (context, child) => SlideTransition(
          child: child,
          position: Tween<Offset>(
            begin: _calculateOffset(),
            end: Offset(0, 0),
          ).animate(
            CurvedAnimation(
              curve: Curves.easeOutBack,
              parent: animation,
              reverseCurve: Curves.easeOutCubic,
            ),
          ),
        ),
        child: child,
      );

  // ignore: missing_return
  Offset _calculateOffset() {
    switch (slideDirection) {
      case AxisDirection.up:
        return Offset(0, 1.5);
      case AxisDirection.right:
        return Offset(-1.5, 0);
      case AxisDirection.down:
        return Offset(0, -1.5);
      case AxisDirection.left:
        return Offset(1.5, 0);
    }
  }
}
