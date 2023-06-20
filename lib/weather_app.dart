
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_with_riverpod/models/weather_model.dart';
import 'package:weather_app_with_riverpod/models/weather_state.dart';
import 'package:weather_app_with_riverpod/providers.dart';
import 'package:weather_app_with_riverpod/widgets/hava_durumu_resim.dart';
import 'package:weather_app_with_riverpod/widgets/location_widget.dart';
import 'package:weather_app_with_riverpod/widgets/max_min_degree.dart';
import 'package:weather_app_with_riverpod/widgets/sehir_sec_form.dart';
import 'package:weather_app_with_riverpod/widgets/son_guncelleme_widget.dart';


@immutable
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint('WeatherApp tetikle.');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("WEATHER"),
        actions: [
          Consumer(builder: (context, ref, child) {
            return IconButton(
                onPressed: () async {
                  final String? secilenSehir = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SehirSecWidget(),));
                  if(secilenSehir != null) {ref.read(weatherNotifierProvider.notifier).bringWeatherData(secilenSehir);}
                 
                },
                icon: const Icon(Icons.search));
          },
           
          ),
        ],
      ),
      body:  Consumer(
        builder: (context, ref, child) {
          return RefreshIndicator(
          
          onRefresh: () async{
            Coord? coord = ref.read(weatherNotifierProvider)!.coord;
            if(coord != null){
            ref.read(weatherNotifierProvider.notifier).refreshWeatherData(coord.lat!, coord.lon!);

            }
            
          },
          child: const WeatherMainWidget(),
        
          );
        },
      )
    );
  }

  

  
}

class WeatherMainWidget extends ConsumerWidget {
  const WeatherMainWidget({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WeatherState state = ref.watch(weatherStateProvider);
    
    switch (state) {
      case WeatherState.initialWeatherState: return const Center(child: Text('Şehir Seçiniz'));
      case WeatherState.weatherLoadedState: 
      Weather? weather = ref.watch(weatherNotifierProvider);
       return ListView(
                children:  [
                  LocationWidget(
                    secilenSehir:  weather!.name,
                    coord: weather.coord!,
                  ),
                  HavaDurumuResimWidget(
                    iconId: weather.weather!.icon!,
                    description: weather.weather!.description!,
                  ),
                  MaxMinDegreeWidget(
                    main: weather.main!,
                  ),
                  SonGuncellemeWidget(timeStamp: weather.dt),
                ],
                          ); 
      case WeatherState.weatherLoadingState: return const Center(child: CircularProgressIndicator());
      case WeatherState.weatherErrorState: return const Center(child: Text('Error 404'));
      default : return const Center(child: Text('default')); 

    }
  }
}
