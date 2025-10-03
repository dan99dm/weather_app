import 'package:flutter/material.dart';

class OpenWeatherIcon extends StatelessWidget {
  final String? iconCode;
  final double width;
  final double height;

  const OpenWeatherIcon({
    super.key,
    required this.iconCode,
    this.width = 100,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    if (iconCode == null || iconCode!.isEmpty) {
      return SizedBox(
        width: width,
        height: height,
        child: Icon(
          Icons.image_not_supported,
          size: width < height ? width : height,
        ),
      );
    }
    final iconUrl = "http://openweathermap.org/img/wn/$iconCode@4x.png";
    return Image.network(
      iconUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
