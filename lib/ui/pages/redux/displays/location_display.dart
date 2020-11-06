import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';

///Widget which displays information about the location
///This is a specific implementation using the Redux package
class LocationDisplay extends StatelessWidget {
  // ignore: public_member_api_docs
  const LocationDisplay({
    Key key,
  }) : super(key: key);

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
                    StoreConnector<WeatherState, String>(
                      converter: (store) => store.state.location.cityName,
                      builder: (context, cityName) => Text(
                        cityName,
                        style: headingStyle,
                      ),
                    ),
                    StoreConnector<WeatherState, String>(
                      converter: (store) => store.state.location.country,
                      builder: (context, country) => Text(
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
                  StoreConnector<WeatherState, double>(
                    converter: (store) => store.state.location.coord.lat,
                    builder: (context, lat) => Text(
                      '${lat.abs().toStringAsFixed(2)}° ${_northOrSouth(lat)}',
                      style: subtitleStyle,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                  StoreConnector<WeatherState, double>(
                    converter: (store) => store.state.location.coord.lon,
                    builder: (context, lon) => Text(
                      '${lon.abs().toStringAsFixed(2)}° ${_eastOrWest(lon)}',
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
