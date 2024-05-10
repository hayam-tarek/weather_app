import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseURL = 'https://api.weatherapi.com/v1';
  WeatherService({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      await dotenv.load(fileName: ".env");
      String apiKey = dotenv.env['API_KEY'] ?? '';
      final Response response = await dio.get(
          '$baseURL/forecast.json?key=$apiKey&q=$city&days=1&aqi=no&alerts=no#');
      Map<String, dynamic> json = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(json);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          "oops there was an error, try later";
      throw Exception(errMessage);
    } catch (e) {
      throw Exception("Something went wrong while fetching data.");
    }
  }
}
