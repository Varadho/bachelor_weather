import 'package:bachelorweather/main.dart' as app;
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  final navigationObserver = NavigatorObserver();

  enableFlutterDriverExtension(handler: (payload) async {
    if (payload == "navigator_pop") {
      navigationObserver.navigator.pop();
    }

    return null;
  });

  app.mainTest(navigationObserver);
}
