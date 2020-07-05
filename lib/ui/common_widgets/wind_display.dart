import 'dart:math';

import 'package:bachelorweather/model/weather.dart';
import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:flutter/material.dart';
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
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PlayAnimation<double>(
                      duration: Duration(milliseconds: 2000),
                      curve: Curves.bounceInOut,
                      tween: Tween<double>(
                          begin: pi / 4,
                          end: (_wind.deg.toDouble() / 360) * 2 * pi),
                      builder:
                          (BuildContext context, Widget child, double value) {
                        return Transform.rotate(
                          angle: value,
                          child: Icon(
                            Icons.arrow_upward,
                            size: 40,
                          ),
                        );
                      },
                    ),
                    Column(
                      children: <Widget>[
                        Text("${(_wind.speed * 3.6).toStringAsFixed(2)} km/h"),
                        Text("${_wind.speed.toStringAsFixed(2)} m/s"),
                      ],
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("No "
                      "Wind data available"),
                ),
        ),
      );
}
