import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:bachelorweather/utility/constants/enums.dart';
import 'package:flutter/material.dart';

class InheritedPage extends StatefulWidget {
  InheritedPage({Key key}) : super(key: key);

  @override
  _InheritedPageState createState() => _InheritedPageState();
}

class _InheritedPageState extends State<InheritedPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backGroundColor,
        body: Center(
          child: Text(StateMethod.INHERITED.name),
        ),
      );
}
