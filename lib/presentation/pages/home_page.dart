import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';
import 'package:weather_bloc/core/constant/convert.dart';
import 'package:weather_bloc/core/cubit/greeting_cubit.dart';
import 'package:weather_bloc/core/cubit/internet_connection_cubit.dart';
import 'package:weather_bloc/core/cubit/weather_cubit.dart';
import 'package:weather_bloc/core/cubit/weather_state.dart';
import 'package:weather_bloc/core/utility/time.dart';
import 'package:weather_bloc/presentation/theme/text_styles.dart';
import 'package:weather_bloc/presentation/widget/background.dart';
import 'package:weather_bloc/presentation/widget/weather_prop_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherState weatherState = context.watch<WeatherCubit>().state;

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: weatherState is WeatherLoading
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Loading ...')
                  ],
                ),
              )
            : weatherState is WeatherSuccess
                ? Background(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          30, 1.2 * kToolbarHeight, 30, 10),

                      // ------------- MAIN CONTENT
                      child: Builder(builder: (context) {
                        InternetConnectionState internetConnectionState =
                            context.watch<InternetConnectionCubit>().state;
                        WeatherState weatherState =
                            context.watch<WeatherCubit>().state;
                        Weather? weather = weatherState is WeatherSuccess
                            ? weatherState.weather
                            : null;
                        GreetingState greeting =
                            context.watch<GreetingCubit>().state;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '📍 ${weather?.areaName}, ${weather?.country}',
                              style:
                                  TextStyles.s.copyWith(color: Colors.white60),
                            ),

                            // ----------- CONDITION IF THE APPS NOT CONNECTED TO THE INTERNET
                            if (internetConnectionState is InternetDisconnected)
                              Text(
                                'Please Connect to Internet',
                                style: TextStyles.sBold
                                    .copyWith(color: Colors.white54),
                              ),
                            const SizedBox(height: 10),
                            Text(
                              greeting.sayGreeting,
                              style: TextStyles.mBold,
                            ),
                            Text(Time.now,
                                style: TextStyles.s
                                    .copyWith(color: Colors.white60)),
                            const SizedBox(height: 30),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Convert.weatherImgAsset(
                                        weather!.weatherMain!),
                                    width: 300,
                                  ),
                                  Text(
                                    '${weather.temperature!.celsius!.toStringAsFixed(1)} °C',
                                    style: TextStyles.lBold,
                                  ),
                                  Text(
                                    weather.weatherMain!.toUpperCase(),
                                    style: TextStyles.mlBold,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                WeatherPropContent(
                                  propertyName: 'Sunrise',
                                  propertyValue:
                                      Time.hourMinute(weather.sunrise!),
                                  propertyImgAsset: 'assets/11.png',
                                ),
                                WeatherPropContent(
                                  propertyName: 'Sunset',
                                  propertyValue:
                                      Time.hourMinute(weather.sunset!),
                                  propertyImgAsset: 'assets/12.png',
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.white54,
                              height: 30,
                            ),
                            Row(
                              children: [
                                WeatherPropContent(
                                  propertyName: 'Humidity',
                                  propertyValue:
                                      '${weather.humidity?.toStringAsFixed(0)}%',
                                  propertyImgAsset: 'assets/14.png',
                                ),
                                WeatherPropContent(
                                  propertyName: 'pressure',
                                  propertyValue:
                                      '${(weather.pressure! * 0.0009859).toStringAsFixed(2)} atm',
                                  propertyImgAsset: 'assets/13.png',
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                      // ----------------- MAIN CONTENT END
                    ),
                  )
                : Center(
                    child: Text(
                    'ERROR',
                    style: TextStyles.mlBold,
                  )));
  }
}
