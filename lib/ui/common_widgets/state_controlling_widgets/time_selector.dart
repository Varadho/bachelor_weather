import 'package:flutter/material.dart';

import '../../../utility/constants/colors.dart';
import '../../../utility/constants/text_styles.dart';
import 'expandable_controls.dart';

class TimeSelector extends StatefulWidget {
  final ValueChanged<DateTime> onTimeSelected;

  const TimeSelector({Key key, this.onTimeSelected}) : super(key: key);
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  DateTime _selectedTime;

  @override
  Widget build(BuildContext context) => ExpandableControls(
        contracted: Icon(
          Icons.access_time,
          color: Colors.white,
        ),
        expanded: RaisedButton(
          shape: StadiumBorder(),
          color: backgroundColor3,
          onPressed: () => widget.onTimeSelected(_selectedTime),
          child: Text(
            "Press me for a callback",
            style: headingStyle.copyWith(fontSize: 16),
          ),
        ),
      );
}
