






import 'package:get_it/get_it.dart';
import 'package:weather_app_with_riverpod/data/weather_api.dart';
import 'package:weather_app_with_riverpod/data/weather_repository.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator(){
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient()); 
  
  
}