import 'dart:math';

import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class WindDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WeatherCard(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlayAnimation<double>(
              duration: Duration(milliseconds: 2000),
              curve: Curves.bounceInOut,
              tween: Tween<double>(
                  begin: Random().nextDouble() % 2 * pi, end: pi / 4),
              builder: (BuildContext context, Widget child, double value) {
                return Transform.rotate(
                  angle: value,
                  child: Icon(Icons.arrow_upward),
                );
              },
            ),
            Column(
              children: <Widget>[
                Text("speed km/h"),
                Text("speed m/s"),
              ],
            )
          ],
        ),
      );
}
