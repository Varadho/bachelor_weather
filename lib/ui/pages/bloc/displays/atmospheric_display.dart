import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';
import '../state_management/weather_bloc.dart';

///Widget which displays information about atmospheric data
///This is a specific implementation using the BLoC package
class AtmosphericDisplay extends StatelessWidget {
  // ignore: public_member_api_docs
  const AtmosphericDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WeatherCard(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Pressure:",
                        style: headingStyle.copyWith(fontSize: 20),
                      ),
                      BlocBuilder<WeatherBloc, WeatherState>(
                        buildWhen: (prev, current) =>
                            prev.atmosphere.pressure !=
                            current.atmosphere.pressure,
                        builder: (context, state) => Text(
                          "${state.atmosphere.pressure} hPa",
                          style: dataStyle,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Humidity:",
                        style: headingStyle.copyWith(fontSize: 20),
                      ),
                      BlocBuilder<WeatherBloc, WeatherState>(
                        buildWhen: (prev, current) =>
                            prev.atmosphere.humidity !=
                            current.atmosphere.humidity,
                        builder: (context, state) => Text(
                          "${state.atmosphere.humidity}%",
                          style: dataStyle,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Cloudiness:",
                        style: headingStyle.copyWith(fontSize: 20),
                      ),
                      BlocBuilder<WeatherBloc, WeatherState>(
                        buildWhen: (prev, current) =>
                            prev.atmosphere.clouds != current.atmosphere.clouds,
                        builder: (context, state) => Text(
                          "${state.atmosphere.clouds}%",
                          style: dataStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  buildWhen: (prev, current) =>
                      prev.atmosphere.description !=
                      current.atmosphere.description,
                  builder: (context, state) => Text(
                    "and ${state.atmosphere.description}",
                    style: headingStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
