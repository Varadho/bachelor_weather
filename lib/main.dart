import 'package:bachelorweather/ui/weather_home_page.dart';
import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comfortable Weather',
      theme: ThemeData(
        textTheme: TextTheme(button: TextStyle(color: textColor)),
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}
