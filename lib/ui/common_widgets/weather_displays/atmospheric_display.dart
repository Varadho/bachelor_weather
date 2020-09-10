import 'package:flutter/material.dart';

import '../../../model/weather.dart';
import '../../../utility/constants/text_styles.dart';
import '../weather_card.dart';

class AtmosphericDisplay extends StatelessWidget {
  final AtmosphericData _atmosphere;

  const AtmosphericDisplay(
    this._atmosphere, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WeatherCard(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Pressure:",
                        style: headingStyle.copyWith(fontSize: 20),
                      ),
                      Text(
                        "${_atmosphere.pressure} hPa",
                        style: dataStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Humidity:",
                        style: headingStyle.copyWith(fontSize: 20),
                      ),
                      Text(
                        "${_atmosphere.humidity}%",
                        style: dataStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Cloudiness:",
                        style: headingStyle.copyWith(fontSize: 20),
                      ),
                      Text(
                        "${_atmosphere.clouds}%",
                        style: dataStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  "and ${_atmosphere.description}",
                  style: headingStyle,
                ),
              ),
            ],
          ),
        ),
      );
}
