import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
            )),
        title: const Text(
          'Search a city',
          style: TextStyle(),
        ),
        // backgroundColor: Colors.lightBlue,
        // elevation: 5,
        // shadowColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: value);
              Navigator.of(context).pop();
            },
            maxLength: 15,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 20,
              ),
              label: const Text("Search"),
              labelStyle: const TextStyle(fontSize: 20),
              suffixIcon: const Icon(Icons.search_rounded),
              hintText: "Enter city name",
              // focusedBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(15),
              //     borderSide: BorderSide(
              //       color: Colors.lightGreen,
              //     )),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(20),
              //   borderSide: BorderSide(
              //     color: Colors.lightBlue,
              //   ),
              // ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
