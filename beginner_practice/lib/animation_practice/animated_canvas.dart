import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimatedCanvas extends StatefulWidget {
  const AnimatedCanvas({super.key});

  @override
  State<AnimatedCanvas> createState() => _AnimatedCanvasState();
}

enum CircleSide { left, right }

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset endPoint;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0); // Top-right
        endPoint = Offset(size.width, size.height); // Bottom-right
        clockwise = true;
        break;
      case CircleSide.right:
        path.moveTo(0, 0); // Top-left
        endPoint = Offset(0, size.height); // Bottom-left
        clockwise = false;
        break;
    }

    path.arcToPoint(
      endPoint,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );
    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  const HalfCircleClipper({required this.side});

  @override
  Path getClip(Size size) {
    return side.toPath(size);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _AnimatedCanvasState extends State<AnimatedCanvas>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotation;
  bool _isRunning = false;
  String status = "The animation is paused";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _rotation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _pauseResume() {
    setState(() {
      if (_isRunning) {
        _isRunning = false;
        _animationController.stop();
        status = "The animation is paused!";
      } else {
        _isRunning = true;
        _animationController.repeat();
        status = "The animation is running!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("C A N V A S")),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            Flexible(
              flex: 2,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(_rotation.value),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ClipPath(
                        clipper: const HalfCircleClipper(side: CircleSide.left),
                        child: Container(
                          height: 80,
                          width: 80,
                          color: Colors.blue,
                        ),
                      ),
                      ClipPath(
                        clipper: const HalfCircleClipper(
                          side: CircleSide.right,
                        ),
                        child: Container(
                          height: 80,
                          width: 80,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(flex: 1),
            Text(status),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pauseResume,
        child: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
