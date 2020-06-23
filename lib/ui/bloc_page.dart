import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:bachelorweather/utility/constants/enums.dart';
import 'package:flutter/material.dart';

class BlocPage extends StatefulWidget {
  BlocPage({Key key}) : super(key: key);

  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backGroundColor,
        body: Center(
          child: Text(StateMethod.BLOC.name),
        ),
      );
}
