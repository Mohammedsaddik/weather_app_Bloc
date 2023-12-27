import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  WeatherModel? weatherModel;
  getWeatherData({required String city}) async {
    try {
      WeatherModel weatherModel =
          await weatherServies(dio: Dio()).getWeather(cityName: city);
      emit(WeatherSuccess(weather: weatherModel));
    } catch (e) {
      emit(WeatherError(errMessage: e.toString()));
    }
  }
}
