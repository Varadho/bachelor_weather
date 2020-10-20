import 'package:flutter/material.dart';

import '../../utility/constants/colors.dart';
import '../../utility/constants/enums.dart';

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

class HomeTile extends StatelessWidget {
  final StateMethod stateMethod;

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
