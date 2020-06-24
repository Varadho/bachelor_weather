import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("City Name"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[Text("Latitude"), Text("Longitude")],
        ),
      ],
    );
  }
}
