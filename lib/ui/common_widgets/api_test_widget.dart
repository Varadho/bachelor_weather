import 'package:flutter/material.dart';

import '../../model/weather.dart';
import '../../utility/api_helper.dart';
import '../../utility/constants/colors.dart';

class ApiTestWidget extends StatefulWidget {
  final String cityName;
  ApiTestWidget({Key key, @required this.cityName}) : super(key: key);

  @override
  _ApiTestWidgetState createState() => _ApiTestWidgetState();
}

class _ApiTestWidgetState extends State<ApiTestWidget> {
  Weather weather;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: RaisedButton(
                color: buttonColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Call me!",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                onPressed: () =>
                    ApiHelper.getCurrentWeatherFor(widget.cityName).then(
                  (value) {
                    setState(
                      () => weather = value,
                    );
                  },
                ),
              ),
            ),
            Text(
              weather == null ? "Test the API Call!" : weather.toString(),
            ),
          ],
        ),
      );
}
