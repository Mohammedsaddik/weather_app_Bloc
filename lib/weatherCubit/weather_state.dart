part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel weather;

  WeatherSuccess({required this.weather});
}

class WeatherError extends WeatherState {
  final String errMessage;
  WeatherError({required this.errMessage});
}
