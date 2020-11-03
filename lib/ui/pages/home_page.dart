import 'package:flutter/material.dart';

import '../../utility/constants/colors.dart';
import '../../utility/constants/enums.dart';

///Landing page of the application. It serves only to pick a state management
///method to be used to display the weather.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(gradient: backgroundGradient),
            ),
            Center(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  for (var method in StateMethod.values)
                    HomeTile(
                      key: Key(method.name),
                      stateMethod: method,
                    ),
                ],
              ),
            ),
          ],
        ),
      );
}

///Widget which can be used to navigate to the implementation of the weather
///page of a specific state management method
class HomeTile extends StatelessWidget {
  ///The state management method
  final StateMethod stateMethod;

  // ignore: public_member_api_docs
  const HomeTile({Key key, this.stateMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            border: Border(
              bottom: BorderSide(color: borderColor, width: 2),
              left: BorderSide(color: borderColor, width: 2),
            ),
          ),
          child: ListTile(
            leading: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  stateMethod.icon,
                  color: iconColor,
                  size: 40,
                ),
              ),
            ),
            title: Text(
              stateMethod.name,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
            ),
            onTap: () => Navigator.of(context).push(stateMethod.route),
          ),
        ),
      );
}
