import 'package:flutter/material.dart';

import '../weather_card.dart';

class RainDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WeatherCard(
        child: Container(
          height: 80,
          width: 200,
          child: Center(
            child: Text("RainDisplay"),
          ),
        ),
      );
}
