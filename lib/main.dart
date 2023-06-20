import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_with_riverpod/locator.dart';
import 'package:weather_app_with_riverpod/providers.dart';
import 'package:weather_app_with_riverpod/weather_app.dart';


void main() {
  
  setupLocator(); 
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('MyApp build tetiklendi.');
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: ref.watch(mainColorProvider),
        ),
        home: const WeatherApp(),
        
      ); 
    
    
  }

}

