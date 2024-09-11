// lib/utils/GHGCalculator.dart
class GHGCalculator {
  static double calculateTotalEmissions({
    required double transport,
    required double energy,
    required double waste,
  }) {
    return transport + energy + waste;
  }
}
