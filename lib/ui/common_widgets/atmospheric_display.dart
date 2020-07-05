import 'package:bachelorweather/model/atmospheric_data.dart';
import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:flutter/material.dart';

class AtmosphericDisplay extends StatelessWidget {
  final AtmosphericData _atmosphere;

  const AtmosphericDisplay(
    this._atmosphere, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WeatherCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 12,
              childAspectRatio: 5 / 2),
          children: <Widget>[
            Text("Pressure: ${_atmosphere.pressure}"),
            Text("Visibility: ${_atmosphere.visibility}"),
            Text("Humidity: ${_atmosphere.humidity}"),
            Text("Clouds: ${_atmosphere.clouds}"),
          ],
        ),
      ),
    );
  }
}
