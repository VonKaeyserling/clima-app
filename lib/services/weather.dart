import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'c68b854b40ae6ff3538adbaf7f730b89';
const url = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper(url: '$url?q=$cityName&units=metric&appid=$apiKey');

    return await networkHelper.getData();
  }

  Future getLocationWeather() async {
    Location location = Location();

    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$url?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey');

    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
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

  String getMessage(int temp) {
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
