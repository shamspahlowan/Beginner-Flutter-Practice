import 'package:flutter/material.dart';

class CubeAnimation extends StatefulWidget {
  const CubeAnimation({super.key});

  @override
  State<CubeAnimation> createState() => _CubeAnimationState();
}

class _CubeAnimationState extends State<CubeAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Color(0xFF4B0082),
                Color(0xFF8F00FF),
              ],
            ).createShader(bounds);
          },
          child: const Text(
            "C A N V A S",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
