import 'dart:convert';




import 'package:http/http.dart' as http;
import 'package:weather_app_with_riverpod/models/sehir_model.dart';
import 'package:weather_app_with_riverpod/models/weather_model.dart';
class WeatherApiClient{
  final http.Client httpClient = http.Client();

  Future<Sehir> getSehirLonAndLat(String? sehirAdi)async{
    final sehirUri = Uri(scheme: 'https', host: 'api.openweathermap.org', path: '/geo/1.0/direct', queryParameters: {'q':'$sehirAdi,TR', 'limit' : '1', 'appid':'51234f336b6a20c738b802edbb7cc2ea'}  );
    final response =   await httpClient.get(sehirUri);
  
    
    final gelenCevapJson = jsonDecode(response.body); 
   


    return Sehir.fromMap(gelenCevapJson[0]); 
  
  }

  Future<Weather> getWeather({required double lat, required double lon}) async {
    final weatherUri = Uri(
      scheme: 'https',
       host: 'api.openweathermap.org', 
       path: '/data/2.5/weather', 
       queryParameters: {'lat': lat.toString(), 'lon' : lon.toString() ,'units':'metric','lang' : 'tr' ,'appid':'51234f336b6a20c738b802edbb7cc2ea'}  );
       final response =   await httpClient.get(weatherUri);

        if(response.statusCode != 200){
          throw Exception('Hava Verisi Getirilemedi!'); 
          }
    
      final gelenCevapJson = jsonDecode(response.body); 
      return Weather.fromMap(gelenCevapJson);
  }


}