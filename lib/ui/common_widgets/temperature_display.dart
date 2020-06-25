import 'package:bachelorweather/model/weather.dart';
import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TemperatureDisplay extends StatelessWidget {
  Info info = Info(
    temperature: 27.0,
    feelsLike: 28.46,
    tempMax: 28.33,
    tempMin: 25.56,
    humidity: 74,
    pressure: 1005,
  );

  @override
  Widget build(BuildContext context) {
    return WeatherCard(
      child: Row(
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
                  text: "${info.feelsLike} ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                  children: [
                    TextSpan(
                      text: "(${info.temperature})",
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
                      Text("${info.tempMax}"),
                    ],
                  ),
                  Container(
                    width: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.arrow_downward),
                      Text("${info.tempMin}"),
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
