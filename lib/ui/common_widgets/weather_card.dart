import 'package:flutter/material.dart';

import '../../utility/constants/colors.dart';

class WeatherCard extends StatelessWidget {
  final Widget child;

  const WeatherCard({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 8.0,
        borderOnForeground: true,
        shape: ContinuousRectangleBorder(
          side: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(42),
        ),
        shadowColor: shadowColor,
        clipBehavior: Clip.antiAlias,
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      );
}
