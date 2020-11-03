import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';

///Widget which displays information about temperature data
///This is a specific implementation using no state management package
class TemperatureDisplay extends StatelessWidget {
  final TemperatureData _temperatures;
  final Color _temperatureColor;

  // ignore: public_member_api_docs
  TemperatureDisplay(this._temperatures, {Key key})
      : _temperatureColor =
            _calculateColor(_temperatures?.feelsLike ?? _temperatures.max);

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
                    color: _temperatureColor,
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
                          Icon(
                            FontAwesomeIcons.longArrowAltUp,
                            color: Colors.red,
                          ),
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
                          Icon(
                            FontAwesomeIcons.longArrowAltDown,
                            color: Colors.lightBlue,
                          ),
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

  static Color _calculateColor(double temperature) {
    int r, g, b;
    if (temperature < 12) {
      r = 20;
      g = (230 - 180 * temperature.clamp(0, 12) / 12).round();
      b = 240;
    } else {
      r = 237;
      g = (237 - 167 * temperature.clamp(12, 38) / 38).round();
      b = 33;
    }
    return Color.fromRGBO(r, g, b, 0.8);
  }
}
