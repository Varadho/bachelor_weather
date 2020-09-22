import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../model/weather.dart';
import '../../../utility/constants/favorite_locations.dart';
import '../../../utility/constants/text_styles.dart';
import 'expandable_controls.dart';

class LocationSelector extends StatefulWidget {
  final ValueChanged<LocationData> onLocationSelected;

  const LocationSelector({Key key, this.onLocationSelected}) : super(key: key);

  @override
  _LocationControlWidgetState createState() => _LocationControlWidgetState();
}

class _LocationControlWidgetState extends State<LocationSelector> {
  LocationData _selectedLocation;

  @override
  Widget build(BuildContext context) => ExpandableControls(
        contracted: Icon(
          Icons.my_location,
          color: Colors.white,
        ),
        expanded: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Icon(
                      Icons.my_location,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Select Location",
                    style: headingStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(
                padding: EdgeInsets.only(right: 60),
                itemExtent: 40,
                shrinkWrap: true,
                itemCount: favoriteLocations.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 3),
                  leading: Icon(
                    Icons.location_on,
                    size: 40,
                    color: Colors.white,
                  ),
                  title: Text(
                    favoriteLocations[index].cityName,
                    style: headingStyle.copyWith(fontSize: 24),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedLocation = favoriteLocations[index];
                    });
                    widget.onLocationSelected(
                      _selectedLocation,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
}
