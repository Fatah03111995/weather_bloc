import 'package:weather_bloc/core/constant/enums.dart';

class Convert {
  static const asset = 'assets/';

  static Map<WeatherCondition, String> weatherConditionToImg = {
    WeatherCondition.atmosphere: '${asset}atmosphere.png',
    WeatherCondition.clear: '${asset}clear.png',
    WeatherCondition.clouds: '${asset}clouds.png',
    WeatherCondition.drizzle: '${asset}drizzle.png',
    WeatherCondition.rain: '${asset}rain.png',
    WeatherCondition.snow: '${asset}snow.png',
    WeatherCondition.thunderstorm: '${asset}thunderstorm',
  };

  static WeatherCondition toWeather(String main) {
    switch (main.toLowerCase()) {
      case 'snow':
        return WeatherCondition.snow;
      case 'rain':
        return WeatherCondition.rain;
      case 'drizzle':
        return WeatherCondition.drizzle;
      case 'clouds':
        return WeatherCondition.clouds;
      case 'clear':
        return WeatherCondition.clear;
      default:
        return WeatherCondition.atmosphere;
    }
  }

  static weatherImgAsset(String main) {
    WeatherCondition weatherCondition = toWeather(main);
    return weatherConditionToImg[weatherCondition]!;
  }
}
