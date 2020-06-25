import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:flutter/material.dart';

class AtmosphericDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WeatherCard(
      child: Container(
        height: 80,
        width: 200,
        child: Center(child: Text("Atmospheric Display")),
      ),
    );
  }
}
