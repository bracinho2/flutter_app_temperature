import 'package:flutter/material.dart';

class FutureForecastCardWidget extends StatelessWidget {
  final String day;
  final String temperature;
  final String wind;
  const FutureForecastCardWidget({
    Key? key,
    required this.day,
    required this.temperature,
    required this.wind,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        width: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '+ ' + day + ' Day',
              style: const TextStyle(
                fontFamily: 'ROBOTO',
                fontSize: 15,
                color: Colors.amber,
              ),
            ),
            Text(
              temperature,
              style: const TextStyle(
                fontFamily: 'ROBOTO',
                fontSize: 15,
                color: Colors.amber,
              ),
            ),
            Text(
              wind,
              style: const TextStyle(
                fontFamily: 'ROBOTO',
                fontSize: 15,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
