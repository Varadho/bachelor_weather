import 'package:bachelorweather/model/weather.dart';
import 'package:bachelorweather/ui/common_widgets/atmospheric_display.dart';
import 'package:bachelorweather/ui/common_widgets/location_display.dart';
import 'package:bachelorweather/ui/common_widgets/rain_display.dart';
import 'package:bachelorweather/ui/common_widgets/sun_time_display.dart';
import 'package:bachelorweather/ui/common_widgets/temperature_display.dart';
import 'package:bachelorweather/ui/common_widgets/wind_display.dart';
import 'package:bachelorweather/utility/api_helper.dart';
import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:flutter/material.dart';

class SSPage extends StatefulWidget {
  final Animation<double> transitionAnimation;
  const SSPage({
    Key key,
    this.transitionAnimation,
  }) : super(key: key);
  @override
  _SSPageState createState() => _SSPageState();
}

class _SSPageState extends State<SSPage> {
  Weather weather;
  bool loading = true;

  @override
  void initState() {
    ApiHelper().getLocationData('Gießen').then((value) {
      setState(() {
        loading = false;
        weather = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => IntrinsicWidth(
        child: Scaffold(
            backgroundColor: backGroundColor,
            body: loading
                ? Center(child: CircularProgressIndicator())
                : AnimatedBuilder(
                    animation: widget.transitionAnimation,
                    builder: (BuildContext context, Widget child) {
                      return FadeTransition(
                        opacity: Tween<double>(begin: 0, end: 1).animate(
                          CurvedAnimation(
                            parent: widget.transitionAnimation,
                            curve: Curves.easeIn,
                            reverseCurve: Curves.easeOutCubic,
                          ),
                        ),
                        child: child,
                      );
                    },
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
                              AtmosphericDisplay(weather?.atmosphere),
                            ],
                          ),
                        ),
                        SlideInWidget(
                          child: Column(
                            children: <Widget>[
                              TemperatureDisplay(weather?.temperature),
                              RainDisplay(),
                            ],
                          ),
                          animation: widget.transitionAnimation,
                          fromRight: false,
                        ),
                        Column(
                          children: <Widget>[
                            SlideInWidget(
                              animation: widget.transitionAnimation,
                              child: WindDisplay(weather?.wind),
                            ),
                            SlideInWidget(
                              animation: widget.transitionAnimation,
                              fromRight: false,
                              child: SunTimeDisplay(
                                  weather?.sunrise, weather?.sunset),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
      );
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
