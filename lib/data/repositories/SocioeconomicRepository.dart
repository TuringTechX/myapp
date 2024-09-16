import '../models/SocioeconomicModel.dart';

class SocioeconomicRepository {
  Future<SocioeconomicModel> getSocioeconomicIndicator(String indicator, String country) async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    return SocioeconomicModel(
      indicatorName: indicator,
      country: country,
      value: 7.8,  // Mock value
      updatedAt: DateTime.now(),
    );
  }
}
