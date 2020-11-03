import 'package:flutter/material.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';

///Widget which displays information about the location
///This is a specific implementation using the MobX package
class LocationDisplay extends StatelessWidget {
  final LocationData _location;

  // ignore: public_member_api_docs
  const LocationDisplay(
    this._location, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var northOrSouth = _location.coord.lat > 0 ? 'North' : 'South';
    var eastOrWest = _location.coord.lon > 0 ? 'East' : 'West';
    return WeatherCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _location.cityName,
                    style: headingStyle,
                  ),
                  Text(
                    " (${_location.country})",
                    style: headingStyle,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '${_location.coord.lat.abs().toStringAsFixed(2)}° $northOrSouth',
                  style: subtitleStyle,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 6,
                ),
                Text(
                  '${_location.coord.lon.abs().toStringAsFixed(2)}° $eastOrWest',
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
