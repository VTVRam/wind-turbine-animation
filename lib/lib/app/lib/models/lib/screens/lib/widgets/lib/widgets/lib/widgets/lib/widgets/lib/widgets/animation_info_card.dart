
import 'package:flutter/material.dart';

import '../models/rotation_speed.dart';

class AnimationInfoCard extends StatelessWidget {
  final bool isRunning;
  final RotationSpeed speed;

  const AnimationInfoCard({
    super.key,
    required this.isRunning,
    required this.speed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Animation Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF183B56),
              ),
            ),

            const SizedBox(height: 16),

            _buildInfoRow(
              icon: Icons.play_circle_outline_rounded,
              label: 'Status',
              value: isRunning ? 'Running' : 'Paused',
              valueColor: isRunning
                  ? const Color(0xFF27834B)
                  : Colors.orange.shade800,
            ),

            const Divider(height: 24),

            _buildInfoRow(
              icon: Icons.rotate_right_rounded,
              label: 'Direction',
              value: 'Clockwise',
            ),

            const Divider(height: 24),

            _buildInfoRow(
              icon: Icons.animation_rounded,
              label: 'Flutter Widget',
              value: 'RotationTransition',
            ),

            const Divider(height: 24),

            _buildInfoRow(
              icon: Icons.speed_rounded,
              label: 'Selected Speed',
              value: '${speed.label} (${speed.duration.inSeconds}s)',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 21,
          color: const Color(0xFF1769AA),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF526777),
            ),
          ),
        ),

        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: valueColor ?? const Color(0xFF183B56),
            ),
          ),
        ),
      ],
    );
  }
}
