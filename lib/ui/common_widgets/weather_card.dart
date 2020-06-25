import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final Widget child;

  const WeatherCard({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 64, vertical: 12),
        elevation: 8.0,
        borderOnForeground: true,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(16),
          gapPadding: 15,
        ),
        shadowColor: shadowColor,
        color: cardColor,
        child: child,
      );
}
