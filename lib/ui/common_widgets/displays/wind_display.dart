import 'package:flutter/material.dart';

import '../../../model/weather.dart';
import '../../../utility/constants/text_styles.dart';
import '../weather_card.dart';
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
                        WindDirectionCompass(
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
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("No Wind data available"),
                ),
        ),
      );
}
