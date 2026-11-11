
import 'package:flutter/material.dart';

class WindLandscape extends StatelessWidget {
  const WindLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WindLandscapePainter(),
      child: const SizedBox.expand(),
    );
  }
}

class WindLandscapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    // 1. Draw the sky with a vertical gradient.
    final skyPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF72C7F5),
          Color(0xFFD8F2FF),
        ],
      ).createShader(
        Rect.fromLTWH(0, 0, width, height),
      );

    canvas.drawRect(
      Rect.fromLTWH(0, 0, width, height),
      skyPaint,
    );

    // 2. Draw the sun.
    final sunPaint = Paint()
      ..color = const Color(0xFFFFD76A);

    canvas.drawCircle(
      Offset(width * 0.82, height * 0.18),
      height * 0.065,
      sunPaint,
    );

    // 3. Draw the clouds.
    _drawCloud(
      canvas,
      Offset(width * 0.20, height * 0.19),
      width * 0.045,
    );

    _drawCloud(
      canvas,
      Offset(width * 0.55, height * 0.12),
      width * 0.035,
    );

    // 4. Draw the distant green hill.
    final distantHillPath = Path()
      ..moveTo(0, height * 0.68)
      ..quadraticBezierTo(
        width * 0.30,
        height * 0.43,
        width * 0.58,
        height * 0.66,
      )
      ..quadraticBezierTo(
        width * 0.80,
        height * 0.80,
        width,
        height * 0.59,
      )
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    final distantHillPaint = Paint()
      ..color = const Color(0xFF78B96A);

    canvas.drawPath(
      distantHillPath,
      distantHillPaint,
    );

    // 5. Draw the foreground hill.
    final foregroundHillPath = Path()
      ..moveTo(0, height * 0.80)
      ..quadraticBezierTo(
        width * 0.32,
        height * 0.64,
        width * 0.62,
        height * 0.81,
      )
      ..quadraticBezierTo(
        width * 0.84,
        height * 0.91,
        width,
        height * 0.75,
      )
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    final foregroundHillPaint = Paint()
      ..color = const Color(0xFF3F9855);

    canvas.drawPath(
      foregroundHillPath,
      foregroundHillPaint,
    );

    // 6. Draw the grass at the bottom.
    final grassPaint = Paint()
      ..color = const Color(0xFF287A43);

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        height * 0.94,
        width,
        height * 0.06,
      ),
      grassPaint,
    );
  }

  // Helper method to draw a soft white cloud.
  void _drawCloud(
    Canvas canvas,
    Offset center,
    double radius,
  ) {
    final cloudPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.88);

    canvas.drawCircle(
      center,
      radius,
      cloudPaint,
    );

    canvas.drawCircle(
      Offset(center.dx + radius * 0.9, center.dy - radius * 0.25),
      radius * 1.15,
      cloudPaint,
    );

    canvas.drawCircle(
      Offset(center.dx + radius * 1.8, center.dy),
      radius * 0.85,
      cloudPaint,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center.dx + radius * 0.9, center.dy + radius * 0.3),
        width: radius * 3.2,
        height: radius * 1.2,
      ),
      cloudPaint,
    );
  }

  @override
  bool shouldRepaint(covariant WindLandscapePainter oldDelegate) {
    return false;
  }
}
