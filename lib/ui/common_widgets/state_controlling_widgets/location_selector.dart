import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../model/location.dart';
import '../../../utility/constants/colors.dart';
import '../../../utility/constants/text_styles.dart';
import 'expandable_controls.dart';

class LocationSelector extends StatefulWidget {
  final ValueChanged<Location> onLocationSelected;

  const LocationSelector({Key key, this.onLocationSelected}) : super(key: key);

  @override
  _LocationControlWidgetState createState() => _LocationControlWidgetState();
}

class _LocationControlWidgetState extends State<LocationSelector> {
  Location _selectedLocation;

  @override
  Widget build(BuildContext context) => ExpandableControls(
        contracted: Icon(
          Icons.my_location,
          color: Colors.white,
        ),
        expanded: RaisedButton(
          shape: StadiumBorder(),
          color: backgroundColor3,
          onPressed: () => widget.onLocationSelected(_selectedLocation),
          child: Text(
            "Press me for a callback",
            style: headingStyle.copyWith(fontSize: 16),
          ),
        ),
      );
}
