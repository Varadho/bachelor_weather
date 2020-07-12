import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:bachelorweather/utility/constants/enums.dart';
import 'package:flutter/material.dart';

class ReduxPage extends StatefulWidget {
  ReduxPage({Key key}) : super(key: key);

  @override
  _ReduxPageState createState() => _ReduxPageState();
}

class _ReduxPageState extends State<ReduxPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor1,
        body: Center(
          child: Text(StateMethod.REDUX.name),
        ),
      );
}
