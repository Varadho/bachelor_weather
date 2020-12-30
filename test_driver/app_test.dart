import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:time/time.dart';

void main() {
  group('Profiling', () {
    FlutterDriver driver;
    final stateMethods = <String>[
      'setState((){})',
      'MobX',
      'Providers',
      'Redux',
      'Business Logic Components',
    ];
    final dynamic dateAbrv = DateTime.now().toIso8601String();
    final timeSelector = find.byValueKey("ts");
    final incrementTimeButton = find.byValueKey('next_time');
    final decrementTimeButton = find.byValueKey('previous_time');

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      //delay running driver tests by 3 seconds,
      // to ensure network data is loaded
      await Future.delayed(3.seconds);
    });

    test('app health', () async {
      var health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    //Test for each state management method
    for (var method in stateMethods) {
      test(
        //Name of method is name of test
        method,
        () async {
          //Find ListTile on Homepage
          final homeTile = find.text(method);
          await driver.waitFor(homeTile);
          //Tap ListTile to navigate to WeatherPage
          await driver.tap(homeTile);

          //Find and open TimeControls
          await driver.waitFor(timeSelector);
          await driver.tap(timeSelector);

          //Find Buttons that control state changes
          await driver.waitFor(incrementTimeButton);
          await driver.waitFor(decrementTimeButton);
          //Clean everything up before starting state changes
          await driver.forceGC();
          //Assume starting position
          await driver.waitUntilFirstFrameRasterized();
          //Trace changes and store them in timeline object
          for (var i = 0; i < 4; i++) {
            final timeline = await driver.traceAction(() async {
              for (var j = 0; j < 40; j++) {
                await driver.tap(incrementTimeButton);
              }
              for (var j = 0; j < 40; j++) {
                await driver.tap(decrementTimeButton);
              }
            });

            final summary = TimelineSummary.summarize(timeline);
            await summary.writeSummaryToFile('$method$dateAbrv', pretty: true);
          }

          //Access custom navigation API
          await driver.requestData('navigator_pop');
        },
        timeout: Timeout(4.minutes),
      );
    }
    // Close the connection to the driver after the tmests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
  });
}
