import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:bachelorweather/utility/constants/enums.dart';
import 'package:flutter/material.dart';

class SSPage extends StatefulWidget {
  @override
  _SSPageState createState() => _SSPageState();
}

class _SSPageState extends State<SSPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backGroundColor,
        body: Center(
          child: Text(StateMethod.SS.name),
        ),
      );
}
