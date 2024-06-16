import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      emit(WeatherLoading());
      Location location = await Location.getCurrentData();
      Weather weather = await WeatherFactory(apiKey)
          .currentWeatherByLocation(location.latitude!, location.longitude!);
      emitWeatherSuccess(weather);
    } catch (e) {
      emitWeatherFailure(e);
    }
  }

  void getWeatherByCity(
      {required BuildContext context, required String cityName}) async {
    try {
      emit(WeatherLoading());
      Weather weather =
          await WeatherFactory(apiKey).currentWeatherByCityName(cityName);
      emitWeatherSuccess(weather);
    } catch (e) {
      emitWeatherFailure(e);
      Future.delayed(const Duration(seconds: 1))
          .then((value) => getWeatherByPosition());
    }
  }

  void emitWeatherSuccess(Weather weather) =>
      emit(WeatherSuccess(weather: weather));
  void emitWeatherFailure(Object error) => emit(WeatherFailure(error));

  @override
  void onChange(Change<WeatherState> change) {
    super.onChange(change);
  }
}
