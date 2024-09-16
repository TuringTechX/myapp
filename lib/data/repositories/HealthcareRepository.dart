import '../models/DataModel.dart';

class DataRepository {
  Future<List<DataModel>> fetchClimateData() async {
    // Simulate API call to fetch climate data
    await Future.delayed(Duration(seconds: 2));

    // Mock data
    return [
      DataModel(
        dataType: "climate",
        timestamp: DateTime.now(),
        data: {
          "temperature": 30.2,
          "humidity": 75,
        },
        source: "Global Climate Sensor",
      ),
      DataModel(
        dataType: "energy",
        timestamp: DateTime.now(),
        data: {
          "energyConsumption": 250,
          "renewablePercentage": 42.0,
        },
        source: "Energy Grid API",
      ),
    ];
  }
}
