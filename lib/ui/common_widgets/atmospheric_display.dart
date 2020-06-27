import 'package:bachelorweather/model/weather.dart';
import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:flutter/material.dart';

class AtmosphericDisplay extends StatelessWidget {
  final Info atmosphericInfo;

  const AtmosphericDisplay({Key key, this.atmosphericInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WeatherCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 120,
              width: 200,
              child: Center(child: Text("Atmospheric Display")),
            ),
          ],
        ),
      ),
    );
  }
}
