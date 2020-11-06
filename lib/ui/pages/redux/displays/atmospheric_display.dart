import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';

///Widget which displays information about the atmosphere
///This is a specific implementation using the Redux package
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
                      StoreConnector<WeatherState, int>(
                        converter: (store) => store.state.atmosphere.pressure,
                        builder: (context, pressure) => Text(
                          "$pressure hPa",
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
                      StoreConnector<WeatherState, int>(
                        converter: (store) => store.state.atmosphere.humidity,
                        builder: (context, humidity) => Text(
                          "$humidity%",
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
                      StoreConnector<WeatherState, int>(
                        converter: (store) => store.state.atmosphere.clouds,
                        builder: (context, clouds) => Text(
                          "$clouds%",
                          style: dataStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: StoreConnector<WeatherState, String>(
                  converter: (store) => store.state.atmosphere.description,
                  builder: (context, description) => Text(
                    "and $description",
                    style: headingStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
