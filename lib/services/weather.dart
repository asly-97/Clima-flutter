import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = "a1cc62b6f0acdbbec9da54a1903c7f4f";
const String openWeatherMapURL =
    'https://api.openweathermap.org/data/3.0/onecall';
const String openWeatherMapGeocodingURL =
    'http://api.openweathermap.org/geo/1.0/direct';

class WeatherModel {
  static Future getCityWeather(String city) async {
    String url =
        '$openWeatherMapGeocodingURL?q=$city&limit=1&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var geocodingData = await networkHelper.getData();
    double lat = geocodingData[0]['lat'];
    double lon = geocodingData[0]['lon'];

    NetworkHelper networkHelper2 = NetworkHelper(
        "$openWeatherMapURL?lat=$lat&lon=$lon&exclude=hourly,daily&appid=$apiKey&units=metric");

    return await networkHelper2.getData();
  }

  static Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    double lat = location.latitude;
    double lon = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?lat=$lat&lon=$lon&exclude=hourly,daily&appid=$apiKey&units=metric");

    return await networkHelper.getData();
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
