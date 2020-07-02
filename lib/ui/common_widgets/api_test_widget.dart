import 'package:bachelorweather/model/weather.dart';
import 'package:bachelorweather/utility/api_helper.dart';
import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:flutter/material.dart';

class ApiTestWidget extends StatefulWidget {
  ApiTestWidget({Key key}) : super(key: key);

  @override
  _ApiTestWidgetState createState() => _ApiTestWidgetState();
}

class _ApiTestWidgetState extends State<ApiTestWidget> {
  Weather weather;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              onPressed: () => ApiHelper().getLocationData("Gießen").then(
                    (value) => setState(
                      () => weather = value,
                    ),
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
}
