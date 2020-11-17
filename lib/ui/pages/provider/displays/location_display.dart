import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';
import '../state_management/weather_notifier.dart';

///Widget which displays information about the location
///This is a specific implementation using the Provider package
class LocationDisplay extends StatelessWidget {
  // ignore: public_member_api_docs
  const LocationDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WeatherCard(
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
                    Selector<WeatherNotifier, String>(
                      selector: (context, notifier) =>
                          notifier.weather.location.cityName,
                      builder: (context, cityName, _) => Text(
                        cityName,
                        style: headingStyle,
                      ),
                    ),
                    Selector<WeatherNotifier, String>(
                      selector: (context, notifier) =>
                          notifier.weather.location.country,
                      builder: (context, country, _) => Text(
                        " ($country)",
                        style: headingStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Selector<WeatherNotifier, double>(
                    selector: (context, notifier) =>
                        notifier.weather.location.coord.lat,
                    builder: (context, lat, _) => Text(
                      '${lat.abs().toStringAsFixed(2)}° '
                      '${_northOrSouth(lat)}',
                      style: subtitleStyle,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                  Selector<WeatherNotifier, double>(
                    selector: (context, notifier) =>
                        notifier.weather.location.coord.lon,
                    builder: (context, lon, _) => Text(
                      '${lon.abs().toStringAsFixed(2)}° '
                      '${_eastOrWest(lon)}',
                      style: subtitleStyle,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
  String _northOrSouth(double latitude) => latitude > 0 ? 'North' : 'South';

  String _eastOrWest(double longitude) => longitude > 0 ? 'East' : 'West';
}
