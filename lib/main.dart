// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/core/cubit/greeting_cubit.dart';

import 'package:weather_bloc/core/cubit/internet_connection_cubit.dart';
import 'package:weather_bloc/core/cubit/weather_cubit.dart';
import 'package:weather_bloc/presentation/pages/home_page.dart';

void main() {
  runApp(MainApp(
    connectivityPlus: Connectivity(),
  ));
}

class MainApp extends StatelessWidget {
  final Connectivity connectivityPlus;
  const MainApp({
    super.key,
    required this.connectivityPlus,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetConnectionCubit>(
            create: (context) =>
                InternetConnectionCubit(connectivityPlus: connectivityPlus)),
        BlocProvider(
          create: (context) => WeatherCubit(),
          lazy: false,
        ),
        BlocProvider<GreetingCubit>(
          create: (context) => GreetingCubit(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
