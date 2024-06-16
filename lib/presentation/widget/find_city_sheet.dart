import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/core/cubit/weather_cubit.dart';
import 'package:weather_bloc/presentation/theme/text_styles.dart';

class FindCitySheet extends StatefulWidget {
  const FindCitySheet({super.key});

  @override
  State<FindCitySheet> createState() => _FindCitySheetState();
}

class _FindCitySheetState extends State<FindCitySheet> {
  TextEditingController cityName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.red,
                    )),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'City Name ...',
                  hintStyle: TextStyles.sm.copyWith(color: Colors.white54),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                ),
                style: TextStyles.sm,
                controller: cityName,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    if (cityName.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Please Fill the Column',
                          style: TextStyles.sm,
                        ),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      context.read<WeatherCubit>().getWeatherByCity(
                          context: context, cityName: cityName.text);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'SEARCH',
                    style: TextStyles.sm.copyWith(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
