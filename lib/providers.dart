import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_with_riverpod/data/weather_repository.dart';
import 'package:weather_app_with_riverpod/locator.dart';
import 'package:weather_app_with_riverpod/models/weather_model.dart';
import 'package:weather_app_with_riverpod/models/weather_state.dart';









final weatherStateProvider = StateProvider<WeatherState>( (ref) =>  WeatherState.initialWeatherState);



class WeatherNotifier extends StateNotifier<Weather?>{
  Ref ref; 
  WeatherNotifier(this.ref):super(null); 
  WeatherRepository weatherRepository = locator<WeatherRepository>();
 
  void bringWeatherData(String sehirAdi) async {
    try{
     ref.read(weatherStateProvider.notifier).state = WeatherState.weatherLoadingState; 
     state = await weatherRepository.getWeather(sehirAdi);
     ref.read(weatherStateProvider.notifier).state = WeatherState.weatherLoadedState; 
    }catch(_){
     ref.read(weatherStateProvider.notifier).state = WeatherState.weatherErrorState; 
    }
  }

  void refreshWeatherData(double lat, double lon) async {

    try{
    state = await weatherRepository.getCurrentWeather(lat, lon);
    if(ref.read(weatherStateProvider.notifier).state != WeatherState.weatherLoadedState){ref.read(weatherStateProvider.notifier).state = WeatherState.weatherLoadedState;}

    }catch(_){
    ref.read(weatherStateProvider.notifier).state = WeatherState.weatherErrorState; 
    }
  }

}



final weatherNotifierProvider = StateNotifierProvider<WeatherNotifier, Weather?>((ref) {
  return WeatherNotifier(ref); 
});

final mainColorProvider = Provider<MaterialColor>((ref) {
     Weather? weather = ref.watch(weatherNotifierProvider);
     String iconCode; 
     if(weather != null){
        iconCode = weather.weather!.icon!;
     }else{
      iconCode = ''; 
     }

     switch(iconCode){
        case '13d':
        case '13n':
        case '11d': 
        case '11n':
      return Colors.brown; 
        case '10d':
        case '10n':
        case '09d': 
        case '09n':
      return Colors.blueGrey; 
        case '04d':
        case '04n':
        case '03d': 
        case '03n':
      return Colors.orange; 
        case '01d':
        case '01n':
        case '02d': 
        case '02n':
      return Colors.yellow;

        default: return Colors.purple; 

      }
},); 

/* 
   switch(){
        case '13d':
        case '13n':
        case '11d': 
        case '11n':
      return ThemeData(primarySwatch: Colors.brown); 
        case '10d':
        case '10n':
        case '09d': 
        case '09n':
      return ThemeData(primarySwatch: Colors.blueGrey); 
        case '04d':
        case '04n':
        case '03d': 
        case '03n':
      return ThemeData(primarySwatch: Colors.orange); 
        case '01d':
        case '01n':
        case '02d': 
        case '02n':
      return ThemeData(primarySwatch: Colors.yellow);

        default: return ThemeData(primarySwatch: Colors.purple); 

      }
  
 */