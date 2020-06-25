import 'package:bachelorweather/ui/common_widgets/api_test_widget.dart';
import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:bachelorweather/utility/constants/enums.dart';
import 'package:flutter/material.dart';

class WeatherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backGroundColor,
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Center(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  for (var method in StateMethod.values)
                    HomeTile(
                      stateMethod: method,
                    ),
                  ApiTestWidget(),
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