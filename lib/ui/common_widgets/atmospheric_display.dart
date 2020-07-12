import 'package:bachelorweather/model/atmospheric_data.dart';
import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:bachelorweather/utility/constants/text_styles.dart';
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
            childAspectRatio: 5 / 2,
          ),
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Pressure:",
                  style: headingStyle,
                ),
                Text(
                  "${_atmosphere.pressure} hPa",
                  style: dataStyle,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "Humidity:",
                  style: headingStyle,
                ),
                Text(
                  "${_atmosphere.humidity}%",
                  style: dataStyle,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "Cloudiness:",
                  style: headingStyle,
                ),
                Text(
                  "${_atmosphere.clouds}%",
                  style: dataStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
