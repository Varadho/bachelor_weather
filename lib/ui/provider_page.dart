import 'package:flutter/material.dart';

import '../utility/constants/colors.dart';
import '../utility/constants/enums.dart';

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
