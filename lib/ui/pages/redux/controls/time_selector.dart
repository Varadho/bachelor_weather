import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/expandable_controls.dart';
import '../state_management/actions.dart';

///Widget which controls the time for which the weather should be displayed.
///This is a specific implementation using the Redux package.
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
                        StoreConnector<WeatherState, DateTime>(
                          converter: (store) => store.state.time,
                          builder: (context, time) => Text(
                            _generateDateString(time, context),
                            style: headingStyle.copyWith(fontSize: 24),
                          ),
                        ),
                        StoreConnector<WeatherState, DateTime>(
                          converter: (store) => store.state.time,
                          builder: (context, time) => Text(
                            _generateTimeString(time),
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
                    IconButton(
                      key: const Key("previous_time"),
                      onPressed: () => StoreProvider.of<WeatherState>(context)
                          .dispatch(DecrementTimeAction()),
                      icon: const Icon(
                        Icons.fast_rewind_sharp,
                        color: Colors.white,
                        size: 75,
                      ),
                    ),
                    Container(),
                    IconButton(
                      key: const Key("next_time"),
                      onPressed: () => StoreProvider.of<WeatherState>(context)
                          .dispatch(IncrementTimeAction()),
                      icon: const Icon(
                        Icons.fast_forward_sharp,
                        color: Colors.white,
                        size: 75,
                      ),
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
