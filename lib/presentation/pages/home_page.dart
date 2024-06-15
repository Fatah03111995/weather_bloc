import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_bloc/presentation/theme/text_styles.dart';
import 'package:weather_bloc/presentation/widget/weather_prop_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(3, 0),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-3, 0),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
            ),
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                color: Colors.transparent,
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(30, 1.2 * kToolbarHeight, 30, 10),

              // ------------- MAIN CONTENT
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📍 Bekasi, Indonesia',
                    style: TextStyles.s.copyWith(color: Colors.white60),
                  ),
                  Text(
                    'Not Connected to Internet',
                    style: TextStyles.sBold.copyWith(color: Colors.white54),
                  ),
                  Text(
                    'Good Morning',
                    style: TextStyles.mBold,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/1.png',
                          width: 300,
                        ),
                        Text(
                          'THUNDERSTORM',
                          style: TextStyles.mBold.copyWith(fontSize: 25),
                        ),
                        Text(
                          '21 °C',
                          style: TextStyles.mBold,
                        ),
                        Text('16/06/2024 . 16:00',
                            style: TextStyles.s.copyWith(color: Colors.white60))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: [
                      WeatherPropContent(
                        propertyName: 'Sunrise',
                        propertyValue: '06:00',
                        propertyImgAsset: 'assets/11.png',
                      ),
                      WeatherPropContent(
                        propertyName: 'Sunset',
                        propertyValue: '18.00',
                        propertyImgAsset: 'assets/12.png',
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white54,
                    height: 30,
                  ),
                  const Row(
                    children: [
                      WeatherPropContent(
                        propertyName: 'Humidity',
                        propertyValue: '60%',
                        propertyImgAsset: 'assets/14.png',
                      ),
                      WeatherPropContent(
                        propertyName: 'pressure',
                        propertyValue: '1 atm',
                        propertyImgAsset: 'assets/13.png',
                      ),
                    ],
                  ),
                ],
              ),
              // ----------------- MAIN CONTENT END
            ),
          )
        ],
      ),
    );
  }
}
