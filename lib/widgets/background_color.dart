import 'package:flutter/material.dart';







class BackgroundColorChangeble extends StatelessWidget {
  const BackgroundColorChangeble({super.key, required this.child, required this.color});




  final Widget child;
  final MaterialColor color;  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, color.shade300, color],
          begin: Alignment.topCenter, end: Alignment.bottomCenter,
          stops: const [0.5, 0.8, 1.0],
        ),
      ),
      child: child,
    );
  }
}