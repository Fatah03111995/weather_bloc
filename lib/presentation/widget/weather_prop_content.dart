// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:weather_bloc/presentation/theme/text_styles.dart';

class WeatherPropContent extends StatelessWidget {
  final String propertyName;
  final String propertyValue;
  final String propertyImgAsset;

  const WeatherPropContent({
    super.key,
    required this.propertyName,
    required this.propertyValue,
    required this.propertyImgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            propertyImgAsset,
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(propertyName,
                  style: TextStyles.sm.copyWith(color: Colors.white60)),
              Text(
                propertyValue,
                style: TextStyles.smBold,
              ),
            ],
          )
        ],
      ),
    );
  }
}
