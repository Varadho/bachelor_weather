//This Project and the corresponding code are
//the intellectual property of Mateusz Czajkowski

//Anyone interested in the continuation of this work may do so without
//the need for an explicit permission to do so.

//Version 1.12 as of 02.01.2021
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/pages/home_page.dart';
import 'utility/constants/colors.dart';
import 'utility/weather_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  _main(null);
}

///Entry point for Flutter Driver integration Tests.
///A [NavigatorObserver] must be provided, to allow custom commands to the
///[Navigator] from the testing suite.
void mainTest(NavigatorObserver navigatorObserver) {
  _main(navigatorObserver);
}

void _main(NavigatorObserver navigatorObserver) {
  WeatherRepository();
  runApp(MyApp(
    navigatorObserver: navigatorObserver,
  ));
}

///Main Widget which is the root for the application
class MyApp extends StatelessWidget {
  ///NavigatorObserver used to relay navigator commands from the Driver tests
  /// to the application
  final NavigatorObserver navigatorObserver;

  ///Constructor which accepts navigatorObserver
  const MyApp({Key key, this.navigatorObserver}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorObservers:
            navigatorObserver == null ? [] : [navigatorObserver],
        title: 'Comfortable Weather',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(button: TextStyle(color: textColor)),
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      );
}
