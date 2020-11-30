import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';
import '../state_management/weather_notifier.dart';

///Widget which displays information about the atmosphere
///This is a specific implementation using the Provider package
class AtmosphericDisplay extends StatelessWidget {
  // ignore: public_member_api_docs
  const AtmosphericDisplay({Key key}) : super(key: key);

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
                      Selector<WeatherNotifier, int>(
                        selector: (context, notifier) =>
                            notifier.state.atmosphere.pressure,
                        builder: (context, pressure, child) => Text(
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
                      Selector<WeatherNotifier, int>(
                        selector: (context, notifier) =>
                            notifier.state.atmosphere.humidity,
                        builder: (context, humidity, child) => Text(
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
                      Selector<WeatherNotifier, int>(
                        selector: (context, notifier) =>
                            notifier.state.atmosphere.clouds,
                        builder: (context, clouds, child) => Text(
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
                child: Selector<WeatherNotifier, String>(
                  selector: (context, notifier) =>
                      notifier.state.atmosphere.description,
                  builder: (context, description, _) => Text(
                    description,
                    style: headingStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
