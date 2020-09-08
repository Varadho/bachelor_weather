import 'package:bachelorweather/ui/common_widgets/state_controlling_widgets/location_selector.dart';
import 'package:bachelorweather/ui/common_widgets/state_controlling_widgets/time_selector.dart';
import 'package:flutter/material.dart';

import '../model/weather.dart';
import '../utility/api_helper.dart';
import '../utility/constants/colors.dart';
import 'common_widgets/weather_displays/atmospheric_display.dart';
import 'common_widgets/weather_displays/location_display.dart';
import 'common_widgets/weather_displays/sun_time_display.dart';
import 'common_widgets/weather_displays/temperature_display.dart';
import 'common_widgets/weather_displays/wind_display.dart';

class SSPage extends StatefulWidget {
  final Animation<double> transitionAnimation;
  final Weather initialWeather;
  const SSPage({
    Key key,
    this.transitionAnimation,
    @required this.initialWeather,
  }) : super(key: key);
  @override
  _SSPageState createState() => _SSPageState();
}

class _SSPageState extends State<SSPage> with TickerProviderStateMixin {
  Weather currentWeather;
  List<Weather> forecast;
  bool loading = false;
  AnimationController _animationController;

  @override
  void initState() {
    currentWeather = widget.initialWeather;
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1300),
      vsync: this,
    );
    _animationController.forward();
    widget.transitionAnimation.addStatusListener((status) {
      if (status == AnimationStatus.reverse) {
        _animationController.reverse();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
            FadeTransition(
              opacity:
                  Tween<double>(begin: 0, end: 1).animate(_animationController),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SlideInWidget(
                    animation: widget.transitionAnimation,
                    slideDirection: AxisDirection.down,
                    child: LocationDisplay(currentWeather?.location),
                  ),
                  SlideInWidget(
                    animation: widget.transitionAnimation,
                    slideDirection: AxisDirection.down,
                    child: SunTimeDisplay(
                      currentWeather?.sunrise,
                      currentWeather?.sunset,
                    ),
                  ),
                  SlideInWidget(
                    animation: widget.transitionAnimation,
                    slideDirection: AxisDirection.right,
                    child: TemperatureDisplay(currentWeather?.temperature),
                  ),
                  SlideInWidget(
                    animation: widget.transitionAnimation,
                    slideDirection: AxisDirection.right,
                    child: WindDisplay(
                      currentWeather?.wind,
                    ),
                  ),
                  SlideInWidget(
                    child: AtmosphericDisplay(currentWeather?.atmosphere),
                    animation: widget.transitionAnimation,
                    slideDirection: AxisDirection.left,
                  ),
                  Container(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SlideInWidget(
                animation: widget.transitionAnimation,
                slideDirection: AxisDirection.right,
                child: TimeSelector(
                  onTimeSelected: (time) => debugPrint("Time callback "
                      "successful"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SlideInWidget(
                animation: widget.transitionAnimation,
                slideDirection: AxisDirection.left,
                child: LocationSelector(
                  onLocationSelected: (location) =>
                      ApiHelper.get5DayForecastFor("Boston")
                          .then((forecastList) {
                    for (var weather in forecastList) {
                      print(
                        "Wind: ${weather.wind}, "
                        "Temp: ${weather.temperature}, "
                        "Clouds: ${weather.clouds}",
                      );
                    }
                  }),
                ),
              ),
            ),
          ],
        ),
      );

  void _refreshWeatherData(context) async {
//    final result = await showSlidingBottomSheet(
//      context,
//      builder: (context) => SlidingSheetDialog(
//        elevation: 8,
//        cornerRadius: 16,
//        snapSpec: const SnapSpec(
//          snap: true,
//          snappings: [1.0],
//          positioning: SnapPositioning.relativeToSheetHeight,
//        ),
//        builder: (context, state) => Container(
//          child: Row(
//            children: [
//              Icon(
//                CupertinoIcons.clock,
//                size: 60,
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//    setState(() {
//      currentWeather = result ?? currentWeather;
//    });
    setState(() {
      loading = true;
    });
    ApiHelper.getCurrentWeatherFor('${currentWeather.location.cityName}')
        .then((value) {
      setState(() {
        currentWeather = value;
        loading = false;
      });
    });
  }
}

class SlideInWidget extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final AxisDirection slideDirection;

  const SlideInWidget({
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
              curve: Curves.elasticOut,
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
        return Offset(0, 1);
      case AxisDirection.right:
        return Offset(-1, 0);
      case AxisDirection.down:
        return Offset(0, -1);
      case AxisDirection.left:
        return Offset(1, 0);
    }
  }
}
