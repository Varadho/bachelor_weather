import 'package:bachelorweather/model/location.dart';
import 'package:flutter/material.dart';

class LocationSelector extends StatefulWidget {
  final List<Location> locations;
  LocationSelector({Key key, this.locations}) : super(key: key);

  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
