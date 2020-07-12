import 'package:bachelorweather/model/temperatures.dart';
import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:bachelorweather/utility/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TemperatureDisplay extends StatelessWidget {
  final Temperatures _temperatures;

  const TemperatureDisplay(this._temperatures, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WeatherCard(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Icon(
              FontAwesomeIcons.temperatureHigh,
              size: 45,
              color: Colors.orange.shade100,
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
}
