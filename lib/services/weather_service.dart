import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class weatherServies {
  final Dio dio;
  String baseUrl = 'http://api.weatherapi.com/v1';

  String apiKey = '3220407caa0e4033950121834232212';

  weatherServies({required this.dio});
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      var response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, please try agine';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops there was an error, please try agine');
    }
  }
}
