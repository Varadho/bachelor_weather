import 'package:flutter/material.dart';

import '../utility/constants/colors.dart';
import '../utility/constants/enums.dart';

class InheritedPage extends StatefulWidget {
  InheritedPage({Key key}) : super(key: key);

  @override
  _InheritedPageState createState() => _InheritedPageState();
}

class _InheritedPageState extends State<InheritedPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor1,
        body: Center(
          child: Text(StateMethod.INHERITED.name),
        ),
      );
}
