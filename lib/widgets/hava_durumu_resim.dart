import 'package:flutter/material.dart';







class HavaDurumuResimWidget extends StatelessWidget {
  final String iconId;
  final String description;  
  const HavaDurumuResimWidget({super.key, required this.iconId, required this.description});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const  EdgeInsets.all(18.0),
      child:  Column(
        children: [
          Image.network('https://openweathermap.org/img/wn/$iconId@2x.png'), 
          Text(description),
        ],
      ),
    );
  }
}