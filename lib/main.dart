import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/pages/home_page.dart';
import 'utility/constants/colors.dart';
import 'utility/weather_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  ///Create first and only instance of WeatherRepository, so it'll start
  ///loading.
  var wr = WeatherRepository();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Comfortable Weather',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(button: TextStyle(color: textColor)),
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      );
}
