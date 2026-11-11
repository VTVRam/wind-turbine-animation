
import 'package:flutter/material.dart';

import 'turbine_rotor.dart';

class WindTurbine extends StatelessWidget {
  final Animation<double> animation;

  const WindTurbine({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        final towerWidth = width * 0.035;
        final towerHeight = height * 0.56;
        final rotorSize = (height * 0.43).clamp(100.0, 250.0).toDouble();

        final towerLeft = width * 0.50 - towerWidth / 2;
        final towerTop = height * 0.36;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            // 1. Turbine tower.
            Positioned(
              left: towerLeft,
              top: towerTop,
              width: towerWidth,
              height: towerHeight,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFE9EEF2),
                      Color(0xFF9EABB5),
                      Color(0xFFF8FAFC),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),

            // 2. Nacelle at the top of the tower.
            Positioned(
              left: width * 0.50 - towerWidth * 0.9,
              top: towerTop - height * 0.035,
              width: towerWidth * 3.2,
              height: height * 0.045,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F7FA),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 4,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
              ),
            ),

            // 3. Rotating rotor with three blades.
            Positioned(
              left: width * 0.50 - rotorSize / 2,
              top: towerTop - rotorSize * 0.48,
              width: rotorSize,
              height: rotorSize,
              child: TurbineRotor(
                animation: animation,
              ),
            ),
          ],
        );
      },
    );
  }
}
