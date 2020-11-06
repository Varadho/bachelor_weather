import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';
import '../state_management/weather_store.dart';

///Widget which displays information about the location
///This is a specific implementation using the MobX package
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
                    Observer(
                      builder: (context) => Text(
                        Provider.of<WeatherStore>(context)
                            .state
                            .location
                            .cityName,
                        style: headingStyle,
                      ),
                    ),
                    Observer(
                      builder: (context) => Text(
                        " (${Provider.of<WeatherStore>(context).state.location.country})",
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
                  Observer(
                    builder: (context) => Text(
                      '${Provider.of<WeatherStore>(context).state.location.coord.lat.abs().toStringAsFixed(2)}° '
                      '${_northOrSouth(Provider.of<WeatherStore>(context).state.location.coord.lat)}',
                      style: subtitleStyle,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                  Observer(
                    builder: (context) => Text(
                      '${Provider.of<WeatherStore>(context).state.location.coord.lon.abs().toStringAsFixed(2)}° '
                      '${_eastOrWest(Provider.of<WeatherStore>(context).state.location.coord.lon)}',
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
