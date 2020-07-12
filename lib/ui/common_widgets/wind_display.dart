import 'dart:math';

import 'package:bachelorweather/model/weather.dart';
import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:bachelorweather/utility/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/simple_animations.dart';

class WindDisplay extends StatelessWidget {
  final Wind _wind;

  const WindDisplay(
    this._wind, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => WeatherCard(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: _wind != null
              ? Column(
                  children: <Widget>[
                    Text(
                      'Winds',
                      style: headingStyle,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 33,
                              child: Text(
                                "N",
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ),
                            Positioned(
                              top: 33,
                              right: 0,
                              child: Text(
                                "E",
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 33,
                              child: Text(
                                "S",
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ),
                            Positioned(
                              top: 33,
                              left: 0,
                              child: Text(
                                "W",
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: PlayAnimation<double>(
                                  duration: Duration(milliseconds: 2000),
                                  curve: Curves.bounceInOut,
                                  tween: Tween<double>(
                                      begin: Random().nextDouble() * 2 * pi,
                                      end: (_wind.deg.toDouble() / 360) *
                                          2 *
                                          pi),
                                  builder: (BuildContext context, Widget child,
                                      double value) {
                                    return Transform.rotate(
                                      angle: value,
                                      child: Icon(
                                        FontAwesomeIcons.arrowUp,
                                        size: 45,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "${(_wind.speed * 3.6).toStringAsFixed(2)} km/h",
                                style: dataStyle,
                              ),
                              Text(
                                "${_wind.speed.toStringAsFixed(2)} m/s",
                                style: dataStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("No Wind data available"),
                ),
        ),
      );
}
