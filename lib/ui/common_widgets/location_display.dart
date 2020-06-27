import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WeatherCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "City Name",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Latitude"),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                Text("Longitude")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
