import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/constants/favorite_locations.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/expandable_controls.dart';

///Widget which controls the location for which the weather should be displayed.
///This is a specific implementation using no state management package.
class LocationSelector extends StatelessWidget {
  // ignore: public_member_api_docs
  final ValueChanged<LocationData> onLocationSelected;
  // ignore: public_member_api_docs
  final LocationData currentLocation;

  // ignore: public_member_api_docs
  const LocationSelector({this.onLocationSelected, this.currentLocation})
      : super(key: const Key("ls"));

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
              flex: 5,
              child: ListView.builder(
                padding: EdgeInsets.only(right: 8),
                shrinkWrap: false,
                itemCount: favoriteLocations.length + 1,
                itemBuilder: (context, index) => index ==
                        favoriteLocations.length
                    ? Container()
                    : ListTile(
                        key: Key(favoriteLocations[index].name),
                        selectedTileColor: Color.fromRGBO(255, 255, 255, 0.3),
                        selected: currentLocation == favoriteLocations[index],
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.location_on,
                          size: 35,
                          color: Colors.white,
                        ),
                        title: Text(
                          favoriteLocations[index].cityName,
                          style: headingStyle.copyWith(fontSize: 24),
                        ),
                        onTap: () =>
                            onLocationSelected(favoriteLocations[index]),
                      ),
              ),
            )
          ],
        ),
      );
}
