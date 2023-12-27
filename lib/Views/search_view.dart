import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weatherCubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Search a city',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: TextField(
            onSubmitted: (value) {
              var wetherCubit = BlocProvider.of<WeatherCubit>(context);
              wetherCubit.getWeatherData(city: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                label: Text('Search'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter a city',
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
