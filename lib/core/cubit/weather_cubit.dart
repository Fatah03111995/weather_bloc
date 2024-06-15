import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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

  void getWeatherByCity({required context, required cityName}) async {
    try {
      emit(WeatherLoading());
      Weather weather =
          await WeatherFactory(apiKey).currentWeatherByCityName(cityName);
      emitWeatherSuccess(weather);
    } catch (e) {
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
            content: const Text(
                'Data Not Found, Please re check your input and try again'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    getWeatherByPosition();
                  },
                  icon: const Icon(Icons.close))
            ]),
      );
    }
  }

  void emitWeatherSuccess(Weather weather) =>
      emit(WeatherSuccess(weather: weather));
  void emitWeatherFailure(Object error) => emit(WeatherFailure(error));

  @override
  void onChange(Change<WeatherState> change) {
    print(change);
    super.onChange(change);
  }
}
