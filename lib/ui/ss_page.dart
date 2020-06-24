import 'package:bachelorweather/ui/common_widgets/location_display.dart';
import 'package:bachelorweather/ui/common_widgets/sun_time_display.dart';
import 'package:bachelorweather/ui/common_widgets/temperature_display.dart';
import 'package:bachelorweather/ui/common_widgets/wind_display.dart';
import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:flutter/material.dart';

class SSPage extends StatefulWidget {
  @override
  _SSPageState createState() => _SSPageState();
}

class _SSPageState extends State<SSPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          LocationDisplay(),
          TemperatureDisplay(),
          WindDisplay(),
          SunTimeDisplay(),
        ],
      ));
}
