
# WindMotion - Wind Turbine Animation

WindMotion is an interactive Flutter application that demonstrates the rotation of a wind turbine using Flutter animation concepts.

The project provides an educational visualization of renewable energy through a custom-drawn landscape and an animated three-blade wind turbine.

## 1. Problem Statement

Beginners often find it difficult to understand wind turbine rotation and Flutter animation concepts through theory alone.

## 2. Proposed Solution

WindMotion demonstrates smooth turbine rotation using Flutter's RotationTransition widget. Users can play, pause, restart and change the rotation speed through an interactive interface.

## 3. Project Objectives

- Demonstrate Flutter animation concepts.
- Understand AnimationController and RotationTransition.
- Create a custom landscape using CustomPainter.
- Implement interactive animation controls.
- Present a simple visual introduction to wind energy.

## 4. Features

- Animated three-blade wind turbine.
- Play and pause controls.
- Restart animation.
- Slow, Normal and Fast speed settings.
- Dynamic animation information card.
- Responsive Material 3 interface.
- Custom-painted sky, clouds, sun and green hills.

## 5. Technologies Used

| Technology | Purpose |
|---|---|
| Flutter | Application development |
| Dart | Programming language |
| Material 3 | User interface |
| AnimationController | Animation management |
| RotationTransition | Rotor rotation |
| CustomPainter | Custom landscape and turbine graphics |
| GitHub | Source code management |
| GitHub Actions | Automated testing and web deployment |
| GitHub Pages | Web application hosting |

## 6. Flutter Concepts Demonstrated

### StatefulWidget
Maintains animation-related state and updates the interface.

### AnimationController
Controls the duration and continuous repetition of the animation.

### SingleTickerProviderStateMixin
Provides a ticker for the animation controller.

### Tween
Defines the animation values from 0 to 1 complete turn.

### RotationTransition
Rotates the turbine rotor through a complete 360-degree cycle.

### CustomPainter
Draws the turbine blades, hub and landscape without external image assets.

### dispose()
Releases the animation controller when the screen is removed.

## 7. Animation Speed

| Speed | Duration per rotation |
|---|---|
| Slow | 12 seconds |
| Normal | 8 seconds |
| Fast | 4 seconds |

## 8. Project Structure

```text
wind-turbine-animation/
├── lib/
│   ├── main.dart
│   ├── app/
│   │   └── wind_motion_app.dart
│   ├── models/
│   │   └── rotation_speed.dart
│   ├── screens/
│   │   └── wind_turbine_screen.dart
│   └── widgets/
│       ├── wind_landscape.dart
│       ├── wind_turbine.dart
│       ├── turbine_rotor.dart
│       ├── animation_controls.dart
│       └── animation_info_card.dart
├── web/
│   ├── index.html
│   └── manifest.json
├── test/
│   └── widget_test.dart
├── .github/
│   └── workflows/
│       └── deploy.yml
├── pubspec.yaml
├── README.md
└── .gitignore
```

## 9. How to Run the Project

Requirements:
- Flutter SDK
- Dart SDK
- A web browser

Run the following commands from the project directory:

```bash
flutter pub get
flutter test
flutter run -d chrome
```

To build the web application:

```bash
flutter build web --release
```

## 10. SDG Relevance

**United Nations Sustainable Development Goal 7: Affordable and Clean Energy**

WindMotion introduces users to wind energy through an interactive turbine visualization.

The application supports awareness and learning about renewable energy. It is an educational demonstration and does not calculate actual electrical power generation.

## 11. Expected Outcome

A responsive Flutter web application displaying a wind turbine with continuously rotating blades and interactive controls for animation speed.

## 12. Conclusion

WindMotion demonstrates how Flutter animation widgets and custom painting can be combined to build an interactive educational application.

The project provides practical experience with StatefulWidget, AnimationController, Tween, RotationTransition and CustomPainter.
