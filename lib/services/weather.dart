import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = "a1cc62b6f0acdbbec9da54a1903c7f4f";
const String openWeatherMapURL =
    'https://api.openweathermap.org/data/3.0/onecall';

class WeatherModel {
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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
