import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';
import '../state_management/weather_notifier.dart';

///Widget which displays information about sunrise, sunset and the current time
///This is a specific implementation using the Provider package
class SunTimeDisplay extends StatelessWidget {
  final String _date = "${DateTime.now().day}."
      "${DateTime.now().month}."
      "${DateTime.now().year}";

  // ignore: public_member_api_docs
  SunTimeDisplay();

  @override
  Widget build(BuildContext context) => WeatherCard(
        child: Column(
          children: [
            Text(
              _date,
              style: headingStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_upward,
                        size: 30,
                        color: Colors.white,
                      ),
                      Selector<WeatherNotifier, DateTime>(
                        selector: (context, notifier) =>
                            notifier.state.location.sunrise,
                        builder: (context, sunrise, _) => RichText(
                          text: TextSpan(
                            text: "Sunrise ",
                            style: TextStyle(fontSize: 16),
                            children: <InlineSpan>[
                              TextSpan(
                                style: dataStyle,
                                text:
                                    "${sunrise.hour.toString().padLeft(2, "0")}:"
                                    "${sunrise.minute.toString().padLeft(2, "0")}",
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ClipOval(
                    child: Container(
                      color: Colors.white.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.wb_sunny,
                          color: Colors.yellowAccent.shade700,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_downward,
                        size: 30,
                        color: Colors.white,
                      ),
                      Selector<WeatherNotifier, DateTime>(
                        selector: (context, notifier) =>
                            notifier.state.location.sunset,
                        builder: (context, sunset, _) => RichText(
                          text: TextSpan(
                            text: "Sunset ",
                            style: TextStyle(fontSize: 16),
                            children: <InlineSpan>[
                              TextSpan(
                                style: dataStyle,
                                text:
                                    "${sunset.hour.toString().padLeft(2, "0")}:"
                                    "${sunset.minute.toString().padLeft(2, "0")}",
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
