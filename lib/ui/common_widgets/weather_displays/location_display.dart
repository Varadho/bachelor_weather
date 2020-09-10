import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/weather.dart';
import '../../../utility/constants/text_styles.dart';
import '../weather_card.dart';

class LocationDisplay extends StatelessWidget {
  final LocationData _location;

  const LocationDisplay(
    this._location, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var northOrSouth = _location.coordinates.lat > 0 ? 'North' : 'South';
    var eastOrWest = _location.coordinates.lon > 0 ? 'East' : 'West';
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
                _location?.cityName ?? "City Name",
                style: headingStyle,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '${_location.coordinates.lat.abs().toStringAsFixed(2)}° $northOrSouth',
                  style: subtitleStyle,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 6,
                ),
                Text(
                  '${_location.coordinates.lon.abs().toStringAsFixed(2)}° $eastOrWest',
                  style: subtitleStyle,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
