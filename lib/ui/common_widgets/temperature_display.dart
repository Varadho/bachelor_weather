import 'package:bachelorweather/model/weather.dart';
import 'package:flutter/material.dart';

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
    return Column(
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: "${info.feelsLike}",
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
          children: <Widget>[
            Icon(Icons.arrow_upward),
            Text("${info.tempMax}"),
            Expanded(child: Container()),
            Icon(Icons.arrow_downward),
            Text("${info.tempMin}"),
          ],
        ),
      ],
    );
  }
}
