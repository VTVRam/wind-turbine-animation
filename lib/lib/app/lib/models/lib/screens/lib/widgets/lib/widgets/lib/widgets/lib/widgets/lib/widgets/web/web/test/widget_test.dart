
import 'package:flutter_test/flutter_test.dart';
import 'package:wind_turbine_animation/app/wind_motion_app.dart';

void main() {
  testWidgets('WindMotion screen loads successfully', (tester) async {
    await tester.pumpWidget(const WindMotionApp());

    expect(find.text('WindMotion'), findsOneWidget);
    expect(find.text('Wind Turbine Animation'), findsOneWidget);
    expect(find.text('Animation Controls'), findsOneWidget);
    expect(find.text('Animation Information'), findsOneWidget);
  });

  testWidgets('Animation controls are visible', (tester) async {
    await tester.pumpWidget(const WindMotionApp());

    expect(find.text('Pause'), findsOneWidget);
    expect(find.text('Restart'), findsOneWidget);
    expect(find.text('Rotation Speed'), findsOneWidget);
  });

  testWidgets('Animation can be paused and played', (tester) async {
    await tester.pumpWidget(const WindMotionApp());

    expect(find.text('Pause'), findsOneWidget);

    await tester.tap(find.text('Pause'));
    await tester.pump();

    expect(find.text('Play'), findsOneWidget);

    await tester.tap(find.text('Play'));
    await tester.pump();

    expect(find.text('Pause'), findsOneWidget);
  });
}
