import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WeatherCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "City Name",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[Text("Latitude"), Text("Longitude")],
          ),
        ],
      ),
    );
  }
}
