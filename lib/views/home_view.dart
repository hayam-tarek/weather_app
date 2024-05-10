import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/error_body.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ));
              },
              icon: const Icon(
                Icons.search_rounded,
              ),
            )
          ],
          title: const Text(
            'Weather App',
            style: TextStyle(),
          ),
          // backgroundColor: Colors.lightBlue,
          // elevation: 5,
          // shadowColor: Colors.lightBlue,
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody();
            } else {
              String message =
                  BlocProvider.of<GetWeatherCubit>(context).message!;
              return ErrorBody(message: message);
            }
          },
        ));
  }
}
