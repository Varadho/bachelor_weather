import 'package:bachelorweather/model/location.dart';
import 'package:bachelorweather/ui/common_widgets/weather_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationDisplay extends StatelessWidget {
  final Location _location;

  const LocationDisplay(
    this._location, {
    Key key,
  }) : super(key: key);
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
                _location?.cityName ?? "City Name",
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
                Text(_location?.coordinates?.lat?.toStringAsFixed(2) ??
                    "Latitude"),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                Text(_location?.coordinates?.lon?.toStringAsFixed(2) ??
                    "Longitude")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
