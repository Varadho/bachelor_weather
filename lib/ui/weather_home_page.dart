import 'package:flutter/material.dart';

import '../model/weather.dart';
import '../utility/api_helper.dart';
import '../utility/constants/colors.dart';
import '../utility/constants/enums.dart';
import 'common_widgets/api_test_widget.dart';
import 'common_widgets/homescreen_drawer.dart';

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  Weather selectedWeather;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    _loadWeatherData("Gießen");
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: backgroundGradient,
              ),
            ),
            Center(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  for (var method in StateMethod.values)
                    HomeTile(
                      stateMethod: method,
                      currentWeather: selectedWeather,
                    ),
                  ApiTestWidget(
                    cityName: selectedWeather?.cityName,
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: HomescreenDrawer(
          loadingCallback: _loadWeatherData,
        ),
      );

  _loadWeatherData(String location) {
    ApiHelper()
        .getLocationData(location)
        .then((value) => setState(() => selectedWeather = value));
  }
}

class HomeTile extends StatelessWidget {
  final StateMethod stateMethod;
  final Weather currentWeather;

  const HomeTile({Key key, this.stateMethod, this.currentWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            border: Border(
              bottom: BorderSide(color: borderColor, width: 2),
              left: BorderSide(color: borderColor, width: 2),
            ),
          ),
          child: ListTile(
            leading: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  stateMethod.icon,
                  color: iconColor,
                  size: 40,
                ),
              ),
            ),
            title: Text(
              stateMethod.name,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
            ),
            onTap: () =>
                Navigator.of(context).push(stateMethod.route(currentWeather)),
          ),
        ),
      );
}
