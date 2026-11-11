import 'package:flutter/material.dart';
import '../screens/wind_turbine_screen.dart';

class WindMotionApp extends StatelessWidget {
  const WindMotionApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedBlue = Color(0xFF1769AA);

    return MaterialApp(
      title: 'WindMotion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedBlue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF3F7FA),
        fontFamily: 'Roboto',
      ),
      home: const WindTurbineScreen(),
    );
  }
}
