import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
              theme: ThemeData(
                useMaterial3: false,
                fontFamily: "Rowdies",
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blueGrey;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
      return Colors.yellow;
    case "partly cloudy":
    case "light clouds": // Optional addition for a lighter blue
      return Colors.lightBlue;
    case "cloudy":
    case "overcast":
      return Colors.blueGrey;
    case "mist":
      return Colors.teal;
    // Rain conditions
    case "patchy rain possible":
    case "patchy light drizzle":
    case "light drizzle":
    case "freezing drizzle":
    case "light freezing drizzle":
    case "patchy light rain":
    case "light rain":
      return Colors.lightBlue;
    case "moderate rain at times":
    case "moderate rain":
    case "heavy rain at times":
    case "heavy rain":
      return Colors.indigo;
    // Snow conditions
    case "patchy snow possible":
    case "light snow":
    case "patchy light snow":
      return Colors.lightBlue;
    case "moderate snow":
    case "patchy moderate snow":
      return Colors.blueGrey;
    case "heavy snow":
    case "patchy heavy snow":
      return Colors.blueGrey; // Darker blueGrey for heavy snow
    // Other conditions
    case "ice pellets":
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
      return Colors.teal;
    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.amber; // Regular amber for thunderstorms
    case "blowing snow":
    case "blizzard":
      return Colors.white as MaterialColor;
    case "fog":
    case "freezing fog":
      return Colors.grey;
    default:
      {
        return Colors.blueGrey;
      } // Default for unknown conditions
  }
}
