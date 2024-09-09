import 'dart:math';

class EnvironmentDataModel {
  double _airQuality = 0.0;
  double _temperature = 0.0;

  double get airQuality => _airQuality;
  double get temperature => _temperature;

  Future<void> updateEnvironmentData() async {
    // Simulating a real-time data fetch
    _airQuality = Random().nextDouble() * 100;
    _temperature = Random().nextDouble() * 40;
  }
}
