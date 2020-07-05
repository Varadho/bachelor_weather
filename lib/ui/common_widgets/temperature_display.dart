import 'package:bachelorweather/model/temperatures.dart';
import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:bachelorweather/utility/constants/colors.dart';
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
          Icon(
            FontAwesomeIcons.temperatureHigh,
            size: 40,
            color: iconColor,
          ),
          Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: "${_temperatures?.feelsLike} ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                  children: [
                    TextSpan(
                      text: "(${_temperatures?.avg})",
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
                  Row(
                    children: <Widget>[
                      Icon(Icons.arrow_upward),
                      Text("${_temperatures.max.toStringAsFixed(2)}"),
                    ],
                  ),
                  Container(
                    width: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.arrow_downward),
                      Text("${_temperatures.min.toStringAsFixed(2)}"),
                    ],
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
