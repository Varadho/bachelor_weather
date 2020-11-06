import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';
import '../state_management/weather_notifier.dart';
import 'wind_direction_display.dart';

///Widget which displays information about wind.
///This is a specific implementation using the Provider package
class WindDisplay extends StatelessWidget {
  // ignore: public_member_api_docs
  WindDisplay({
    Key key,
  });

  @override
  Widget build(BuildContext context) => WeatherCard(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Text(
                'Winds',
                style: headingStyle,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  WindDirectionDisplay(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: <Widget>[
                        Consumer<WeatherNotifier>(
                          builder: (context, notifier, _) => Text(
                            "${(notifier.weather.wind.mpsSpeed * 3.6).toStringAsFixed(2)} km/h",
                            style: dataStyle,
                          ),
                        ),
                        Consumer<WeatherNotifier>(
                          builder: (context, notifier, _) => Text(
                            "${notifier.weather.wind.mpsSpeed.toStringAsFixed(2)} m/s",
                            style: dataStyle,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
