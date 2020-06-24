import 'package:flutter/material.dart';

class SunTimeDisplay extends StatelessWidget {
  int sunrise = 1592989704;
  int sunset = 1593044701;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(Icons.arrow_upward),
            Text(
              "Sunrise ${DateTime.fromMillisecondsSinceEpoch(sunrise).hour}"
              ":${DateTime.fromMillisecondsSinceEpoch(sunrise).minute}",
            ),
          ],
        ),
        Icon(
          Icons.wb_sunny,
          size: 30,
        ),
        Column(
          children: <Widget>[
            Icon(Icons.arrow_downward),
            Text(
              "Sunset ${DateTime.fromMillisecondsSinceEpoch(sunset).hour}"
              ":${DateTime.fromMillisecondsSinceEpoch(sunset).minute}",
            ),
          ],
        ),
      ],
    );
  }
}
