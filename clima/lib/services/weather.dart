import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const openWeatherAppURL = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = 'f7d69d4fbccefe012c6d65911060e565';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper nh = NetworkHelper(
        '$openWeatherAppURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherdata = await nh.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper netowrkhelper = NetworkHelper(
        '$openWeatherAppURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherdata = await netowrkhelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition == 0) {
      return 'ERROR';
    } else if (condition < 300) {
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
    if (temp == 9999999) {
      return 'Unable to get Weather';
    } else if (temp > 25) {
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
