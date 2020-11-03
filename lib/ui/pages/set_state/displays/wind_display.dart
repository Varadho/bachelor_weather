import 'package:flutter/material.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';
import 'wind_direction_display.dart';

///Widget which displays information about wind.
///This is a specific implementation using no state management package
class WindDisplay extends StatelessWidget {
  final WindData _wind;

  // ignore: public_member_api_docs
  WindDisplay(
    this._wind, {
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
                  WindDirectionDisplay(
                    windDegrees: _wind.deg,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "${(_wind.mpsSpeed * 3.6).toStringAsFixed(2)} km/h",
                          style: dataStyle,
                        ),
                        Text(
                          "${_wind.mpsSpeed.toStringAsFixed(2)} m/s",
                          style: dataStyle,
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
