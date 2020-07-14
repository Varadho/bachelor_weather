import 'package:flutter/material.dart';

import '../../utility/constants/text_styles.dart';

class HomescreenDrawer extends Drawer {
  final ValueChanged<String> loadingCallback;

  const HomescreenDrawer({Key key, this.loadingCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Icon(
                    Icons.not_listed_location,
                    size: 80,
                  ),
                  Text(
                    "Select location to load",
                    style: dataStyle,
                  ),
                ],
              ),
            ),
            ...[
              "Gießen",
              "Köln",
              "Hamburg",
              "Frankfurt",
              "Los Angeles",
              "New York",
              "Tokyo",
              "Kapstadt",
              "Teheran",
            ]
                .map((location) => ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(
                        location,
                        style: dataStyle,
                      ),
                      onTap: () => _callbackWrapper(location, context),
                    ))
                .toList(),
          ],
        ),
      );

  _callbackWrapper(String location, BuildContext context) {
    loadingCallback(location);
    Navigator.of(context).pop();
  }
}
