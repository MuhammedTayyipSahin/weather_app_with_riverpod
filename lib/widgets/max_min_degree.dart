import 'package:flutter/material.dart';
import 'package:weather_app_with_riverpod/models/weather_model.dart';






class MaxMinDegreeWidget extends StatelessWidget {
  final Main main; 
  const MaxMinDegreeWidget({super.key, required this.main});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
        Text("Sıcaklık: ${main.temp} ", style: const TextStyle(fontSize: 18) ),
        Text("Maks: ${main.tempMax}", style: const TextStyle(fontSize: 18) ),
        Text("Min:  ${main.tempMin}", style: const TextStyle(fontSize: 18) ),
        
      ],
    );
  }
}