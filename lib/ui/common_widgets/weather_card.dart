import 'package:flutter/material.dart';

import '../../utility/constants/colors.dart';

///Stylized card widget, which can be wrapped around any other widget
class WeatherCard extends StatelessWidget {
  ///The child widget, which is to be wrapped
  final Widget child;

  ///The radius of the rounded corners of this card
  final double radius;

  // ignore: public_member_api_docs
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
