
import 'dart:math' as math;

import 'package:flutter/material.dart';

class TurbineRotor extends StatelessWidget {
  final Animation<double> animation;

  const TurbineRotor({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: CustomPaint(
        painter: TurbineRotorPainter(),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class TurbineRotorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final bladeLength = size.height * 0.43;
    final bladeWidth = size.width * 0.105;

    // Paint for the turbine blades.
    final bladePaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFF8FAFC),
          Color(0xFFB9C9D6),
          Color(0xFFEAF1F6),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(
        Rect.fromCenter(
          center: center,
          width: bladeWidth * 2,
          height: bladeLength,
        ),
      )
      ..style = PaintingStyle.fill;

    // Draw three blades, each separated by 120 degrees.
    for (int i = 0; i < 3; i++) {
      final angle = (i * 120 - 90) * math.pi / 180;

      canvas.save();

      canvas.translate(
        center.dx,
        center.dy,
      );

      canvas.rotate(angle);

      final bladePath = Path()
        ..moveTo(-bladeWidth * 0.35, -size.height * 0.025)
        ..quadraticBezierTo(
          -bladeWidth * 0.55,
          -bladeLength * 0.45,
          -bladeWidth * 0.35,
          -bladeLength,
        )
        ..quadraticBezierTo(
          0,
          -bladeLength * 0.95,
          bladeWidth * 0.35,
          -bladeLength,
        )
        ..quadraticBezierTo(
          bladeWidth * 0.55,
          -bladeLength * 0.45,
          bladeWidth * 0.35,
          -size.height * 0.025,
        )
        ..close();

      canvas.drawPath(
        bladePath,
        bladePaint,
      );

      canvas.restore();
    }

    // Draw the central rotor hub.
    final hubPaint = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xFFFFFFFF),
          Color(0xFF8FA3B2),
          Color(0xFFE5EDF2),
        ],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: size.width * 0.075,
        ),
      );

    canvas.drawCircle(
      center,
      size.width * 0.075,
      hubPaint,
    );

    // Draw a small center detail.
    canvas.drawCircle(
      center,
      size.width * 0.025,
      Paint()..color = const Color(0xFF607D8B),
    );
  }

  @override
  bool shouldRepaint(covariant TurbineRotorPainter oldDelegate) {
    return false;
  }
}
