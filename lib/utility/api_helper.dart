import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_state.dart';
//import 'api_key.dart';

class ApiHelper {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/';

  static const String currentQuery = 'weather';

  static const String forecastQuery = 'forecast';

  static const String oneCallQuery = 'onecall';

  static const String cityQuery = '?q=';

  static const String units = '&units=metric';

  static const String apiKey = '&appid=1234567890';

  static Future<List<WeatherState>> get5DayForecastFor(String location) async {
    var result = <WeatherState>[];
    try {
      var body = (await http.get(
        Uri.parse(
          '$baseUrl$forecastQuery'
          '$cityQuery$location'
          '$units$apiKey',
        ),
      ))
          .body;
      var json = jsonDecode(body) as Map<String, dynamic>;
      var jsonWeatherList = (json["list"] as List);
      var locationData = LocationData.fromJson(json['city']);
      for (var weather in jsonWeatherList) {
        Map<String, dynamic> mainMap = weather['main'];
        mainMap.addAll(weather['clouds']);
        mainMap.addAll(weather['weather'][0]);
        result.add(
          WeatherState(
            location: locationData,
            time: weather['dt'],
            temperature: TemperatureData.fromJson(weather['main']),
            atmosphere: AtmosphericData.fromJson(weather['main']),
            wind: WindData.fromJson(weather['wind']),
          ),
        );
      }
    } on Exception catch (e) {
      print(e);
    }
    return result;
  }

//   static Future<Weather> getCurrentWeatherFor(String location) async {
//     try {
//       var body = (await http.get(
//         Uri.parse(
//           '$baseUrl$currentQuery'
//               '$cityQuery$location'
//               '$units$apiKey',
//         ),
//       ))
//           .body;
//       var json = jsonDecode(body);
// //      return Weather.fromJson(json);
//     } on Exception catch (e) {
//       print(e);
//     }
//     return null;
//   }
}
/*
* Parameters:

    coord
        coord.lon City geo location, longitude
        coord.lat City geo location, latitude
    weather (more info Weather condition codes)
        weather.id Weather condition id
        weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
        weather.description Weather condition within the group. You can get the output in your language. Learn more
        weather.icon Weather icon id
    base Internal parameter
    main
        main.temp Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
        main.feels_like Temperature. This temperature parameter accounts for the human perception of weather. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
        main.pressure Atmospheric pressure (on the sea level, if there is no sea_level or grnd_level data), hPa
        main.humidity Humidity, %
        main.temp_min Minimum temperature at the moment. This is minimal currently observed temperature (within large megalopolises and urban areas). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
        main.temp_max Maximum temperature at the moment. This is maximal currently observed temperature (within large megalopolises and urban areas). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
        main.sea_level Atmospheric pressure on the sea level, hPa
        main.grnd_level Atmospheric pressure on the ground level, hPa
    wind
        wind.speed Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
        wind.deg Wind direction, degrees (meteorological)
        wind.gust Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
    clouds
        clouds.all Cloudiness, %
    rain
        rain.1h Rain volume for the last 1 hour, mm
        rain.3h Rain volume for the last 3 hours, mm
    snow
        snow.1h Snow volume for the last 1 hour, mm
        snow.3h Snow volume for the last 3 hours, mm
    dt Time of data calculation, unix, UTC
    sys
        sys.type Internal parameter
        sys.id Internal parameter
        sys.message Internal parameter
        sys.country Country code (GB, JP etc.)
        sys.sunrise Sunrise time, unix, UTC
        sys.sunset Sunset time, unix, UTC
    timezone Shift in seconds from UTC
    id City ID
    name City name
    cod Internal parameter

* */
