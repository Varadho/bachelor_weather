import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';

import 'model/weather.dart';
import 'ui/redux/reducer.dart';
import 'ui/weather_home_page.dart';
import 'utility/constants/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //TODO Use the store, Luke!
  final store = Store<Weather>(weatherReducer, initialState: null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Comfortable Weather',
        theme: ThemeData(
          textTheme: TextTheme(button: TextStyle(color: textColor)),
          primarySwatch: Colors.blue,
        ),
        home: WeatherHomePage(),
      );
}
