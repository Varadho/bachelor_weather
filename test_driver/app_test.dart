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
      'Bussines Logic Components',
    ];
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

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('app health', () async {
      var health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });
    for (var method in stateMethods) {
      test(method, () async {
        final homeTile = find.text(method);
        await driver.waitFor(homeTile);
        await driver.tap(homeTile);

        await driver.waitFor(timeSelector);
        await driver.tap(timeSelector);

        await driver.waitFor(incrementTimeButton);
        await driver.waitFor(decrementTimeButton);
        final timeline = await driver.traceAction(() async {
          for (var i = 0; i < 40; i++) {
            await driver.tap(incrementTimeButton);
          }
          for (var i = 0; i < 40; i++) {
            await driver.tap(decrementTimeButton);
          }
        });

        final summary = TimelineSummary.summarize(timeline);

        await summary.writeSummaryToFile('${method}_summary', pretty: true);
        await summary.writeTimelineToFile('${method}_timeline', pretty: true);
        await driver.requestData('navigator_pop');
      });
    }
  });
}
