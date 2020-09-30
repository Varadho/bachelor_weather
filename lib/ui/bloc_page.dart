import 'package:flutter/material.dart';

import '../utility/constants/colors.dart';
import '../utility/constants/enums.dart';

class BlocPage extends StatefulWidget {
  BlocPage({Key key}) : super(key: key);

  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor1,
        body: Center(
          child: Text(StateMethod.BLOC.name),
        ),
      );
}
