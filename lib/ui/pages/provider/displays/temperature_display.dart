import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/constants/text_styles.dart';
import '../../../common_widgets/weather_card.dart';
import '../state_management/weather_notifier.dart';

///Widget which displays information about temperature data
///This is a specific implementation using the Provider package
class TemperatureDisplay extends StatelessWidget {
  // ignore: public_member_api_docs
  TemperatureDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WeatherCard(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                alignment: Alignment.center,
                color: Color.fromRGBO(255, 255, 255, 0.2),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Selector<WeatherNotifier, double>(
                    selector: (context, notifier) =>
                        notifier.state.temperature.feelsLike,
                    builder: (context, feelsLike, child) => Icon(
                      FontAwesomeIcons.temperatureHigh,
                      size: 36,
                      color: _calculateColor(feelsLike),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Selector<WeatherNotifier, TemperatureData>(
                  selector: (context, notifier) => notifier.state.temperature,
                  builder: (context, temperature, _) => RichText(
                    text: TextSpan(
                      text: "${temperature.feelsLike}°C ",
                      style: headingStyle,
                      children: [
                        TextSpan(
                          text: "(${temperature.avg}°C)",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.longArrowAltUp,
                            color: Colors.red,
                          ),
                          Selector<WeatherNotifier, double>(
                            selector: (context, notifier) =>
                                notifier.state.temperature.max,
                            builder: (context, max, child) => Text(
                              "${max.toStringAsFixed(2)}°C ",
                              style: dataStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.longArrowAltDown,
                            color: Colors.lightBlue,
                          ),
                          Selector<WeatherNotifier, double>(
                            selector: (context, notifier) =>
                                notifier.state.temperature.min,
                            builder: (context, min, child) => Text(
                              "${min.toStringAsFixed(2)}°C ",
                              style: dataStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );

  static Color _calculateColor(double temperature) {
    int r, g, b;
    if (temperature < 12) {
      r = 20;
      g = (230 - 180 * temperature.clamp(0, 12) / 12).round();
      b = 240;
    } else {
      r = 237;
      g = (237 - 167 * temperature.clamp(12, 38) / 38).round();
      b = 33;
    }
    return Color.fromRGBO(r, g, b, 0.8);
  }
}
