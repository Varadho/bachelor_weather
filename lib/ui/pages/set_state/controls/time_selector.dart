import 'package:flutter/material.dart';

import '../../../../utility/constants/colors.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/expandable_controls.dart';

///Widget which controls the time for which the weather should be displayed.
///This is a specific implementation using no state management package.
class TimeSelector extends StatelessWidget {
  final VoidCallback onIncrementTime;
  final VoidCallback onDecrementTime;
  final DateTime currentTime;

  // ignore: public_member_api_docs
  const TimeSelector({
    this.onIncrementTime,
    this.onDecrementTime,
    this.currentTime,
  }) : super(key: const Key("ts"));

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
                        Text(
                          _generateDateString(currentTime, context),
                          style: headingStyle.copyWith(fontSize: 24),
                        ),
                        Text(
                          _generateTimeString(currentTime),
                          style: headingStyle.copyWith(fontSize: 38),
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
                        onTap: onDecrementTime,
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
                        onTap: onIncrementTime,
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
