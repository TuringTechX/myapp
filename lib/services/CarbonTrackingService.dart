// lib/services/CarbonTrackingService.dart
import '../models/CarbonFootprintModel.dart';
import '../repositories/CarbonFootprintRepository.dart';

class CarbonTrackingService {
  final CarbonFootprintRepository _repository = CarbonFootprintRepository();

  Future<CarbonFootprintModel> getCarbonFootprint() async {
    return await _repository.fetchCarbonFootprintData();
  }

  Future<void> reduceFootprint() async {
    await _repository.reduceCarbonFootprint();
  }
}
