import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utility/constants/colors.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/expandable_controls.dart';
import '../state_management/weather_notifier.dart';

///Widget which controls the time for which the weather should be displayed.
///This is a specific implementation using the Provider package.
class TimeSelector extends StatelessWidget {
  // ignore: public_member_api_docs
  const TimeSelector() : super(key: const Key("ts"));

  @override
  Widget build(BuildContext context) => ExpandableControls(
        contracted: Icon(
          Icons.access_time,
          color: Colors.white,
        ),
        expanded: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.access_time,
                      size: 75,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<WeatherNotifier>(
                          builder: (context, notifier, _) => Text(
                            _generateDateString(notifier.weather.time, context),
                            style: headingStyle.copyWith(fontSize: 24),
                          ),
                        ),
                        Consumer<WeatherNotifier>(
                          builder: (context, notifier, _) => Text(
                            _generateTimeString(notifier.weather.time),
                            style: headingStyle.copyWith(fontSize: 38),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: GestureDetector(
                        key: const Key("previous_time"),
                        onTap: () =>
                            Provider.of<WeatherNotifier>(context, listen: false)
                                .decrementTime(),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 75,
                        ),
                      ),
                      customBorder: CircleBorder(),
                      splashColor: backgroundColor2.withOpacity(0.7),
                      splashFactory: InkSplash.splashFactory,
                      enableFeedback: false,
                    ),
                    Container(),
                    InkWell(
                      child: GestureDetector(
                        key: const Key("next_time"),
                        onTap: () =>
                            Provider.of<WeatherNotifier>(context, listen: false)
                                .incrementTime(),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 75,
                        ),
                      ),
                      customBorder: CircleBorder(),
                      splashColor: backgroundColor2.withOpacity(0.7),
                      splashFactory: InkSplash.splashFactory,
                      enableFeedback: false,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  String _generateDateString(DateTime dateTime, BuildContext context) {
    if (dateTime.weekday != DateTime.now().weekday) {
      return "${Localizations.of<MaterialLocalizations>(context, MaterialLocalizations).narrowWeekdays[dateTime.weekday % 7]}, "
          "${dateTime.day}.${dateTime.month}";
    }
    return "Today";
  }

  String _generateTimeString(DateTime dateTime) =>
      "${dateTime.hour.toString().padLeft(2, "0")}:"
      "${dateTime.minute.toString().padLeft(2, "0")}";
}
