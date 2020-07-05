import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:flutter/material.dart';

class SunTimeDisplay extends StatelessWidget {
  final int _sunrise;
  final int _sunset;

  const SunTimeDisplay(this._sunrise, this._sunset, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Sunrise: $_sunrise");
    print("Sunset: $_sunset");
    return WeatherCard(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.arrow_upward),
                Text(
                  "Sunrise ${DateTime.fromMillisecondsSinceEpoch(_sunrise * 1000).hour}"
                  ":${DateTime.fromMillisecondsSinceEpoch(_sunrise * 1000).minute}",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.wb_sunny,
                color: Colors.amber,
                size: 40,
              ),
            ),
            Column(
              children: <Widget>[
                Icon(Icons.arrow_downward),
                Text(
                  "Sunset ${DateTime.fromMillisecondsSinceEpoch(_sunset * 1000).hour}"
                  ":${DateTime.fromMillisecondsSinceEpoch(_sunset * 1000).minute < 10 ? "0" : ""}${DateTime.fromMillisecondsSinceEpoch(_sunset * 1000).minute}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
