
import 'package:flutter/material.dart';

import '../models/rotation_speed.dart';
import '../widgets/animation_controls.dart';
import '../widgets/animation_info_card.dart';
import '../widgets/wind_landscape.dart';
import '../widgets/wind_turbine.dart';

class WindTurbineScreen extends StatefulWidget {
  const WindTurbineScreen({super.key});

  @override
  State<WindTurbineScreen> createState() => _WindTurbineScreenState();
}

class _WindTurbineScreenState extends State<WindTurbineScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  RotationSpeed _speed = RotationSpeed.normal;

  bool get _isRunning => _controller.isAnimating;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: _speed.duration,
    )..repeat();
  }

  void _toggleAnimation() {
    setState(() {
      if (_controller.isAnimating) {
        _controller.stop();
      } else {
        _controller.repeat();
      }
    });
  }

  void _restartAnimation() {
    setState(() {
      _controller
        ..stop()
        ..reset()
        ..repeat();
    });
  }

  void _changeSpeed(RotationSpeed? speed) {
    if (speed == null) return;

    setState(() {
      _speed = speed;

      final wasRunning = _controller.isAnimating;

      _controller.duration = speed.duration;

      if (wasRunning) {
        _controller
          ..stop()
          ..repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WindMotion',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Icon(
              Icons.air_rounded,
              color: Color(0xFF1769AA),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 700;

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 900,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Wind Turbine Animation',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF183B56),
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        'Explore renewable energy through a rotating turbine.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey.shade700,
                        ),
                      ),

                      const SizedBox(height: 18),

                      AspectRatio(
                        aspectRatio: isWide ? 1.9 : 0.94,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              const WindLandscape(),

                              WindTurbine(
                                animation: _controller,
                              ),

                              Positioned(
                                left: 14,
                                top: 14,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(
                                      alpha: 0.88,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 7,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.eco,
                                          size: 16,
                                          color: Color(0xFF32834B),
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'Clean energy',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      AnimationControls(
                        isRunning: _isRunning,
                        selectedSpeed: _speed,
                        onToggle: _toggleAnimation,
                        onRestart: _restartAnimation,
                        onSpeedChanged: _changeSpeed,
                      ),

                      const SizedBox(height: 12),

                      AnimationInfoCard(
                        isRunning: _isRunning,
                        speed: _speed,
                      ),

                      const SizedBox(height: 18),

                      const Center(
                        child: Text(
                          'Flutter • RotationTransition • AnimationController',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
