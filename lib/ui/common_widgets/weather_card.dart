import 'package:flutter/material.dart';

import '../../utility/constants/colors.dart';

class WeatherCard extends StatelessWidget {
  final Widget child;
  final double radius;

  const WeatherCard({Key key, this.child, this.radius = 32}) : super(key: key);
  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 8.0,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(radius),
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
