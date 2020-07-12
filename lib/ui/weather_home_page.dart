import 'package:bachelorweather/model/weather.dart';
import 'package:bachelorweather/ui/common_widgets/api_test_widget.dart';
import 'package:bachelorweather/utility/api_helper.dart';
import 'package:bachelorweather/utility/constants/colors.dart';
import 'package:bachelorweather/utility/constants/enums.dart';
import 'package:bachelorweather/utility/constants/text_styles.dart';
import 'package:flutter/material.dart';

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  Weather selectedWeather;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
        drawer: _customDrawer(),
      );

  Widget _customDrawer() => Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Icon(
                    Icons.not_listed_location,
                    size: 80,
                  ),
                  Text(
                    "Select location to load",
                    style: dataStyle,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Gießen",
                style: dataStyle,
              ),
              onTap: () => _loadWeatherData("Gießen"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Köln",
                style: dataStyle,
              ),
              onTap: () => _loadWeatherData("Köln"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Hamburg",
                style: dataStyle,
              ),
              onTap: () => _loadWeatherData("Hamburg"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Frankfurt",
                style: dataStyle,
              ),
              onTap: () => _loadWeatherData("Frankfurt"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Los Angeles",
                style: dataStyle,
              ),
              onTap: () => _loadWeatherData("Los Angeles"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "New York",
                style: dataStyle,
              ),
              onTap: () => _loadWeatherData("New York"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Tokyo",
                style: dataStyle,
              ),
              onTap: () => _loadWeatherData("Tokyo"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Kapstadt",
                style: dataStyle,
              ),
              onTap: () => _loadWeatherData("Kapstadt"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                "Teheran",
                style: dataStyle,
              ),
              onTap: () => _loadWeatherData("Teheran"),
            ),
          ],
        ),
      );

  _loadWeatherData(String location) {
    ApiHelper()
        .getLocationData(location)
        .then((value) => setState(() => selectedWeather = value));
    _scaffoldKey.currentState.openEndDrawer();
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
