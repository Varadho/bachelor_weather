import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';
import '../state_management/weather_bloc.dart';

///Widget which displays information about the location
///This is a specific implementation using the BLoC package
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
                    BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) => Text(
                        state.location.cityName,
                        style: headingStyle,
                      ),
                    ),
                    BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) => Text(
                        " (${state.location.country})",
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
                  BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) => Text(
                      '${state.location.coord.lat.abs().toStringAsFixed(2)}° '
                      '${_northOrSouth(state.location.coord.lat)}',
                      style: subtitleStyle,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                  BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) => Text(
                      '${state.location.coord.lon.abs().toStringAsFixed(2)}° '
                      '${_eastOrWest(state.location.coord.lon)}',
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
