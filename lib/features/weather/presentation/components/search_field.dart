import 'package:flutter/material.dart';
import 'package:weather_app/config/colors.dart';
import 'package:weather_app/config/text_styles.dart';

class WeatherSearchField extends StatelessWidget {
  final TextEditingController controller;

  const WeatherSearchField({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for a city',
        fillColor: BrandColors.white,
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          color: BrandColors.grey,
        ),
        hintStyle: BrandTextStyle.s18w400.copyWith(
          color: BrandColors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 2,
            color: BrandColors.lightGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 2,
            color: BrandColors.lightGrey,
          ),
        ),
      ),
    );
  }
}
