
import 'package:flutter/material.dart';

import '../models/rotation_speed.dart';

class AnimationControls extends StatelessWidget {
  final bool isRunning;
  final RotationSpeed selectedSpeed;
  final VoidCallback onToggle;
  final VoidCallback onRestart;
  final ValueChanged<RotationSpeed?> onSpeedChanged;

  const AnimationControls({
    super.key,
    required this.isRunning,
    required this.selectedSpeed,
    required this.onToggle,
    required this.onRestart,
    required this.onSpeedChanged,
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Animation Controls',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF183B56),
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: onToggle,
                    icon: Icon(
                      isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    ),
                    label: Text(
                      isRunning ? 'Pause' : 'Play',
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                OutlinedButton.icon(
                  onPressed: onRestart,
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Restart'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              'Rotation Speed',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF526777),
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<RotationSpeed>(
              value: selectedSpeed,
              isExpanded: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.speed_rounded),
                filled: true,
                fillColor: const Color(0xFFF3F7FA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
              items: RotationSpeed.values.map((speed) {
                return DropdownMenuItem<RotationSpeed>(
                  value: speed,
                  child: Text(
                    '${speed.label} • ${speed.duration.inSeconds}s per rotation',
                  ),
                );
              }).toList(),
              onChanged: onSpeedChanged,
            ),
          ],
        ),
      ),
    );
  }
}
