import 'package:bachelorweather/utility/constants/enums.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Profiling', () {
    FlutterDriver driver;

    final timeSelector = find.byValueKey("ts");
    final incrementTimeButton = find.byValueKey('next_time');
    final decrementTimeButton = find.byValueKey('previous_time');

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('setState', () async {
      final homeTile = find.byValueKey(StateMethod.SS.name);
      final timeline = await driver.traceAction(() async {
        await driver.tap(homeTile);
        await driver.tap(timeSelector);
        for (var i = 0; i < 40; i++) {
          await driver.tap(incrementTimeButton);
        }
      });
      final summary = TimelineSummary.summarize(timeline);

      await summary.writeSummaryToFile('scrolling_summary', pretty: true);
      // Optionally, write the entire timeline to disk in a json format. This
      // file can be opened in the Chrome browser's tracing tools found by
      // navigating to chrome://tracing.
      await summary.writeTimelineToFile('scrolling_timeline', pretty: true);
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
  });
}
