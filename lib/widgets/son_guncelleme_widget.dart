import 'package:flutter/material.dart';





class SonGuncellemeWidget extends StatelessWidget {
  

  const SonGuncellemeWidget({super.key, required this.timeStamp});
  final int? timeStamp;

  @override
  Widget build(BuildContext context) {
    var date = timeStamp !=null ? DateTime.fromMillisecondsSinceEpoch((timeStamp!+10800)*1000) : null; 
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Text(
          date != null ? 'Son Güncelleme: ${date.hour}:${date.minute}' : 'Son Güncelleme Tarihine Ulaşılamadı',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300
          ),
        ),
      ),
    );
  }
}