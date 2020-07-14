import 'package:flutter/material.dart';

import '../../model/location.dart';

class LocationSelector extends StatefulWidget {
  final List<Location> locations;
  LocationSelector({Key key, this.locations}) : super(key: key);

  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  @override
  Widget build(BuildContext context) => Container();
}
