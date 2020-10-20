import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final timeSelector = find.byValueKey("ts");
    final locationSelector = find.byValueKey("ls");
    final incrementTimeButton = find.byValueKey('next_time');
    final decrementTimeButton = find.byValueKey('previous_time');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('starts around now', () async {
      var now = DateTime.now();
    });

    test('increments the counter', () async {
      // First, tap the button.
      for (var i = 0; i < 35; i++) {
        await driver.tap(incrementTimeButton);
      }
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
  });
}
