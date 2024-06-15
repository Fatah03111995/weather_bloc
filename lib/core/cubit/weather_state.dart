import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherLoading extends WeatherState {}

final class WeatherFailure extends WeatherState {
  final Object error;

  const WeatherFailure(this.error);
}

final class WeatherSuccess extends WeatherState {
  final Weather weather;

  const WeatherSuccess({required this.weather});
}
