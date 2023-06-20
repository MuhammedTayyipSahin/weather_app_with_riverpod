







import 'package:weather_app_with_riverpod/data/weather_api.dart';
import 'package:weather_app_with_riverpod/locator.dart';
import 'package:weather_app_with_riverpod/models/sehir_model.dart';
import 'package:weather_app_with_riverpod/models/weather_model.dart';

class WeatherRepository{
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();
  

   Future<Weather> getWeather (String? sehirAdi) async {
    final Sehir sehir = await weatherApiClient.getSehirLonAndLat(sehirAdi); 
    
    Weather weather = await weatherApiClient.getWeather(lat: sehir.lat!, lon: sehir.lon!); 
    return weather ;
    }

    Future<Weather> getCurrentWeather (double lat, double lon) async {
    Weather weather = await weatherApiClient.getWeather(lat: lat, lon: lon); 
    return weather ;
    }

    

}