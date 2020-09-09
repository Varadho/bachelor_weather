import 'package:flutter/material.dart';
import 'package:time/time.dart';

import '../../../utility/constants/text_styles.dart';
import '../weather_card.dart';

class SunTimeDisplay extends StatelessWidget {
  final DateTime _sunrise, _sunset;
  final int timezone;
  final String _date = "${DateTime.now().day}."
      "${DateTime.now().month}."
      "${DateTime.now().year}";
  SunTimeDisplay(int sunrise, int sunset, {Key key, this.timezone = 0})
      : _sunrise =
            DateTime.fromMillisecondsSinceEpoch(sunrise) + timezone.seconds,
        _sunset =
            DateTime.fromMillisecondsSinceEpoch(sunset) + timezone.seconds,
        super(key: key);

  @override
  Widget build(BuildContext context) => WeatherCard(
        child: Column(
          children: [
            Text(
              _date,
              style: headingStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_upward,
                        size: 30,
                        color: Colors.white,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Sunrise ",
                          style: TextStyle(fontSize: 16),
                          children: <InlineSpan>[
                            TextSpan(
                                style: dataStyle,
                                text:
                                    "${_sunrise.hour.toString().padLeft(2, "0")}:"
                                    "${_sunrise.minute.toString().padLeft(2, "0")}")
                          ],
                        ),
                      ),
                    ],
                  ),
                  ClipOval(
                    child: Container(
                      color: Colors.white.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.wb_sunny,
                          color: Colors.yellowAccent.shade700,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_downward,
                        size: 30,
                        color: Colors.white,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Sunset ",
                          style: TextStyle(fontSize: 16),
                          children: <InlineSpan>[
                            TextSpan(
                                style: dataStyle,
                                text:
                                    "${_sunset.hour.toString().padLeft(2, "0")}:"
                                    "${_sunset.minute.toString().padLeft(2, "0")}")
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
