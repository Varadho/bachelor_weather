import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/temperatures.dart';
import '../../../utility/constants/text_styles.dart';
import '../weather_card.dart';

class TemperatureDisplay extends StatelessWidget {
  final Temperatures _temperatures;
  Color _temperatureWarmth;

  TemperatureDisplay(this._temperatures, {Key key}) {
    var r = 0, g = 0, b = 0;
    if (_temperatures.feelsLike < 12) {
      r = 20;
      g = (230 - 180 * _temperatures.feelsLike.clamp(0, 12) / 12).round();
      b = 240;
    } else {
      r = 237;
      g = (237 - 167 * _temperatures.feelsLike.clamp(12, 38) / 38).round();
      b = 33;
    }

    _temperatureWarmth = Color.fromRGBO(r, g, b, 0.8);
  }

  @override
  Widget build(BuildContext context) => WeatherCard(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                alignment: Alignment.center,
                color: Color.fromRGBO(255, 255, 255, 0.2),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    FontAwesomeIcons.temperatureHigh,
                    size: 36,
                    color: _temperatureWarmth,
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "${_temperatures?.feelsLike}°C ",
                    style: headingStyle,
                    children: [
                      TextSpan(
                        text: "(${_temperatures?.avg}°C)",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.longArrowAltUp),
                          Text(
                            "${_temperatures.max.toStringAsFixed(2)}°C ",
                            style: dataStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.longArrowAltDown),
                          Text(
                            "${_temperatures.min.toStringAsFixed(2)}°C ",
                            style: dataStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}
