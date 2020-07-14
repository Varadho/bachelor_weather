import 'package:flutter/material.dart';

import '../../utility/constants/text_styles.dart';

class HomescreenDrawer extends StatelessWidget {
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
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Gießen",
                style: dataStyle,
              ),
              onTap: () => loadingCallback("Gießen"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Köln",
                style: dataStyle,
              ),
              onTap: () => loadingCallback("Köln"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Hamburg",
                style: dataStyle,
              ),
              onTap: () => loadingCallback("Hamburg"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Frankfurt",
                style: dataStyle,
              ),
              onTap: () => loadingCallback("Frankfurt"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Los Angeles",
                style: dataStyle,
              ),
              onTap: () => loadingCallback("Los Angeles"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "New York",
                style: dataStyle,
              ),
              onTap: () => loadingCallback("New York"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Tokyo",
                style: dataStyle,
              ),
              onTap: () => loadingCallback("Tokyo"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Kapstadt",
                style: dataStyle,
              ),
              onTap: () => loadingCallback("Kapstadt"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Teheran",
                style: dataStyle,
              ),
              onTap: () => loadingCallback("Teheran"),
            ),
          ],
        ),
      );
}
