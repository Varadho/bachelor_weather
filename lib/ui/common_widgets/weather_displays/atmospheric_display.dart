import 'package:flutter/material.dart';

import '../../../model/atmospheric_data.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Pressure:",
                        style: headingStyle,
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
                        style: headingStyle,
                      ),
                      Text(
                        "${_atmosphere.humidity}%",
                        style: dataStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Cloudiness:",
                    style: headingStyle,
                  ),
                  Text(
                    "${_atmosphere.clouds}%",
                    style: dataStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
