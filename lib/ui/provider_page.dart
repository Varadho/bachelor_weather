import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:bachelorweather/utility/constants/enums.dart';
import 'package:flutter/material.dart';

class ProviderPage extends StatefulWidget {
  ProviderPage({Key key}) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor1,
        body: Center(
          child: Text(StateMethod.PROVIDERS.name),
        ),
      );
}
