/// Available full-rotation durations for the turbine rotor.
enum RotationSpeed {
  slow('Slow', Duration(seconds: 12)),
  normal('Normal', Duration(seconds: 8)),
  fast('Fast', Duration(seconds: 4));

  const RotationSpeed(this.label, this.duration);

  final String label;
  final Duration duration;
}
