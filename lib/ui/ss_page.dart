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

class _SSPageState extends State<SSPage> with TickerProviderStateMixin {
  Weather weather;
  bool loading = false;
  AnimationController _animationController;

  @override
  void initState() {
    weather = widget.initialWeather;
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
              : FadeTransition(
                  opacity: Tween<double>(begin: 0, end: 1)
                      .animate(_animationController),
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
    ApiHelper()
        .getCurrentWeatherFor('${weather.location.cityName}')
        .then((value) {
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
              curve: Curves.elasticOut,
              parent: animation,
              reverseCurve: Curves.easeOutCubic,
            ),
          ),
        ),
        child: child,
      );
}
