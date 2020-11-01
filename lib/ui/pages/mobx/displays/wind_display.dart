import 'package:bachelorweather/model/weather_state.dart';
import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:bachelorweather/utility/constants/text_styles.dart';
import 'package:flutter/material.dart';

import 'compass_widget.dart';

class WindDisplay extends StatelessWidget {
  final WindData _wind;

  WindDisplay(
    this._wind, {
    Key key,
  });

  @override
  Widget build(BuildContext context) => WeatherCard(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Text(
                'Winds',
                style: headingStyle,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  WindDirectionDisplay(
                    windDegrees: _wind.deg,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "${(_wind.mpsSpeed * 3.6).toStringAsFixed(2)} km/h",
                          style: dataStyle,
                        ),
                        Text(
                          "${_wind.mpsSpeed.toStringAsFixed(2)} m/s",
                          style: dataStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
