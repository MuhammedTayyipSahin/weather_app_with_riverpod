

import 'package:flutter/material.dart';

class SehirSecWidget extends StatefulWidget {
  const SehirSecWidget({super.key});

  @override
  State<SehirSecWidget> createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {
  final  _textController = TextEditingController(); 

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Şehir Seç"),),

      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Şehir',
                      hintText: 'Şehir Seçin',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(flex: 1, child: ElevatedButton.icon(icon: const Icon(Icons.search_sharp), onPressed: (){
Navigator.of(context).pop(_textController.text);
                }, label: const Text("Bas")))
              ],
            ),
        ),
        ),
    );
  }
}