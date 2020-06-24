import 'dart:math';

import 'package:flutter/material.dart';

class WindDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: Matrix4.rotationZ(2 * pi * 270 / 360),
            child: Icon(Icons.arrow_upward),
          ),
          Column(
            children: <Widget>[
              Text("speed km/h"),
              Text("speed m/s"),
            ],
          )
        ],
      );
}
