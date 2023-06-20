import 'package:flutter/material.dart';
import 'package:weather_app_with_riverpod/models/weather_model.dart';







class LocationWidget extends StatelessWidget {
  final String? secilenSehir; 
  final Coord coord; 
  const LocationWidget({super.key,  this.secilenSehir, required this.coord});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const  EdgeInsets.all(12.0),
      child:  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( '$secilenSehir - TR', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24 ),),
          Text('Enlem: ${coord.lat}, Boylam: ${coord.lon}',style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16) ),
        ],
      )),
    );
  }
}