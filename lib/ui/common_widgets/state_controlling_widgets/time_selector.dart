import 'package:auto_size_text/auto_size_text.dart';
import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:time/time.dart';

import '../../../utility/constants/text_styles.dart';
import 'expandable_controls.dart';

class TimeSelector extends StatefulWidget {
  final ValueChanged<DateTime> onTimeSelected;
  final DateTime initialTime;

  const TimeSelector({Key key, this.onTimeSelected, this.initialTime})
      : super(key: key);
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  DateTime _selectedTime;
  final DateTime _now = DateTime.now();
  bool _changing = false;
  bool _longPressing = false;

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
                  AutoSizeText(
                    _generateTimeString(),
                    style: headingStyle.copyWith(fontSize: 38),
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

  String _generateTimeString() {
    var out = StringBuffer();
    if (_selectedTime.weekday != _now.weekday ||
        _selectedTime.difference(_now) > 1.days) {
      out.write(
          "${Localizations.of<MaterialLocalizations>(context, MaterialLocalizations).narrowWeekdays[_selectedTime.weekday - 1]}, ");
    }
    if (_selectedTime.difference(_now) >= 6.days) {
      out.write("${_selectedTime.day}.${_selectedTime.month}, ");
    }
    out.write(
      "${_selectedTime.hour.toString().padLeft(2, "0")}:"
      "${_selectedTime.minute.toString().padLeft(2, "0")}",
    );
    return out.toString();
  }

  void _incrementTime() {
    setState(() {
      _selectedTime = _selectedTime + 20.minutes;
    });
    widget.onTimeSelected(_selectedTime);
  }

  void _decrementTime() {
    setState(() {
      _selectedTime = _selectedTime - 20.minutes;
    });
    widget.onTimeSelected(_selectedTime);
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
