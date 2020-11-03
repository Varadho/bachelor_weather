import 'package:flutter/material.dart';
import 'package:time/time.dart';

import '../../../../utility/constants/colors.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../../utility/weather_repository.dart';
import '../../../common_widgets/expandable_controls.dart';

///Widget which controls the time for which the weather should be displayed.
///This is a specific implementation using the BLoC package.
class TimeSelector extends StatefulWidget {
  // ignore: public_member_api_docs
  final ValueChanged<DateTime> onTimeSelected;
  // ignore: public_member_api_docs
  final DateTime initialTime;

  // ignore: public_member_api_docs
  const TimeSelector({
    this.onTimeSelected,
    this.initialTime,
  }) : super(key: const Key("ts"));
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  DateTime _selectedTime;
  final DateTime _now = DateTime.now();
  bool _changing = false;
  bool _longPressing = false;
  final DateTime _earliest = WeatherRepository().forecast.first.time;
  final DateTime _latest = WeatherRepository().forecast.last.time;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime ?? DateTime.now();
  }

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
                          _generateDateString(),
                          style: headingStyle.copyWith(fontSize: 24),
                        ),
                        Text(
                          _generateTimeString(),
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
                        onTapDown: (details) => _decreaseRapidly(),
                        onTapUp: (details) => _haltChange(),
                        onTapCancel: _haltChange,
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
                        onTapDown: (details) => _increaseRapidly(),
                        onTapUp: (details) => _haltChange(),
                        onTapCancel: _haltChange,
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

  String _generateDateString() {
    if (_selectedTime.weekday - 1 != _now.weekday) {
      return "${Localizations.of<MaterialLocalizations>(context, MaterialLocalizations).narrowWeekdays[_selectedTime.weekday - 1]}, "
          "${_selectedTime.day}.${_selectedTime.month}";
    }
    return "Today";
  }

  String _generateTimeString() =>
      "${_selectedTime.hour.toString().padLeft(2, "0")}:"
      "${_selectedTime.minute.toString().padLeft(2, "0")}";

  void _incrementTime() {
    if ((_selectedTime.difference(_latest) + 3.hours).isNegative) {
      setState(() {
        _selectedTime = _selectedTime + 3.hours;
      });
      widget.onTimeSelected(_selectedTime);
    }
  }

  void _decrementTime() {
    if (!(_selectedTime.difference(_earliest) - 1.days).isNegative) {
      setState(() {
        _selectedTime = _selectedTime - 3.hours;
      });
      widget.onTimeSelected(_selectedTime);
    }
  }

  void _increaseRapidly() async {
    _changeRapidly(_incrementTime);
  }

  void _decreaseRapidly() async {
    _changeRapidly(_decrementTime);
  }

  void _changeRapidly(VoidCallback change) async {
    if (_changing) return;
    setState(() {
      _changing = true;
    });
    _longPressing = true;
    while (_longPressing) {
      change();
      await Future.delayed(100.milliseconds);
    }
    setState(() {
      _changing = false;
    });
  }

  void _haltChange() => setState(() {
        _changing = false;
        _longPressing = false;
      });
}
