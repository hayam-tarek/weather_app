import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  String? message;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(dio: Dio()).getCurrentWeather(city: cityName);
      emit(WeatherLoadedState());
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      message = e.toString();
      emit(WeatherErrorState());
    }
  }
}
