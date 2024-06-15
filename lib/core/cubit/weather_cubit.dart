import 'package:bloc/bloc.dart';
import 'package:weather/weather.dart';
import 'package:weather_bloc/core/cubit/weather_state.dart';
import 'package:weather_bloc/core/data/data.dart';
import 'package:weather_bloc/core/services/location.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoading()) {
    getWeatherByPosition();
  }

  void getWeatherByPosition() async {
    try {
      Location location = await Location.getCurrentData();
      Weather weather = await WeatherFactory(apiKey)
          .currentWeatherByLocation(location.latitude!, location.longitude!);
      emitWeatherSuccess(weather);
    } catch (e) {
      emitWeatherFailure(e);
    }
  }

  void getWeatherByCity(String cityName) async {
    try {
      Weather weather =
          await WeatherFactory(apiKey).currentWeatherByCityName(cityName);
      emitWeatherSuccess(weather);
    } catch (e) {
      emitWeatherFailure(e);
    }
  }

  void emitWeatherSuccess(Weather weather) =>
      emit(WeatherSuccess(weather: weather));
  void emitWeatherFailure(Object error) => emit(WeatherFailure(error));
}
