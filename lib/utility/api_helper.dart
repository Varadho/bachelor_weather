import 'dart:convert';

import 'package:bachelorweather/model/weather.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  static const String cityQuery = '?q=';

  static const String units = '&units=metric';

  static const String apiKey = '&appid=573837f4c28160cee116989fa116e4dc';

  Future<Weather> getLocationData(String location) async {
    try {
      var body = (await http
              .get(Uri.parse('$baseUrl$cityQuery$location$units$apiKey')))
          .body;
      var json = jsonDecode(body);
      return Weather.fromJson(json);
    } catch (e) {
      print(e);
    }
    return null;
  }
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
