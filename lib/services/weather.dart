

import 'location.dart';
import 'networking.dart';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '950efa08e5748ee512c834ef2965faa2';
class WeatherModel {
  Future<void> getCityWeather(String cityName) async{
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
  var weatherData =  await networkHelper.getData();
  return weatherData;
  }

  double latitude;
  double longitude;
  Future<dynamic> getLocationData()async {
    Location a = Location();
    await a.getCurrentLocation();
    latitude = a.latitude;
    longitude = a.longitude;
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
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
