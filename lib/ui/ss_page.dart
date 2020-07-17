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
    this.initialWeather,
  }) : super(key: key);
  @override
  _SSPageState createState() => _SSPageState();
}

class _SSPageState extends State<SSPage> {
  Weather weather;
  bool loading = false;

  @override
  void initState() {
    weather = widget.initialWeather;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      floatingActionButton: FloatingActionButton(
        child: loading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(borderColor),
              )
            : Icon(Icons.refresh),
        onPressed: _refreshWeatherData,
        backgroundColor: cardColor,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: backgroundGradient,
            ),
          ),
          weather == null
              ? Container()
              : AnimatedBuilder(
                  animation: widget.transitionAnimation,
                  builder: (context, child) => FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(
                      CurvedAnimation(
                        parent: widget.transitionAnimation,
                        curve: Curves.easeIn,
                        reverseCurve: Curves.easeOutCubic,
                      ),
                    ),
                    child: child,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SlideInWidget(
                        animation: widget.transitionAnimation,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            LocationDisplay(weather?.location),
                          ],
                        ),
                      ),
                      SlideInWidget(
                        animation: widget.transitionAnimation,
                        fromRight: false,
                        child: SunTimeDisplay(
                          weather?.sunrise,
                          weather?.sunset,
                        ),
                      ),
                      SlideInWidget(
                        animation: widget.transitionAnimation,
                        child: TemperatureDisplay(weather?.temperature),
                      ),
                      SlideInWidget(
                        child: AtmosphericDisplay(weather?.atmosphere),
                        animation: widget.transitionAnimation,
                        fromRight: false,
                      ),
                      Column(
                        children: <Widget>[
                          SlideInWidget(
                            animation: widget.transitionAnimation,
                            child: WindDisplay(
                              weather?.wind,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ],
      ));

  void _refreshWeatherData() {
    setState(() {
      loading = true;
    });
    ApiHelper().getCurrentWeatherFor('${weather.location.cityName}').then((value) {
      setState(() {
        weather = value;
        loading = false;
      });
    });
  }
}

class SlideInWidget extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final bool fromRight;

  const SlideInWidget({
    Key key,
    @required this.child,
    @required this.animation,
    this.fromRight = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (context, child) => SlideTransition(
          child: child,
          position: Tween<Offset>(
            begin: Offset(fromRight ? 1 : -1, fromRight ? 0 : 0),
            end: Offset(0, 0),
          ).animate(
            CurvedAnimation(
              curve: Curves.easeOutCubic,
              parent: animation,
              reverseCurve: Curves.easeOutCubic,
            ),
          ),
        ),
        child: child,
      );
}
