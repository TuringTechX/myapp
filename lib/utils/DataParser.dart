class DataParser {
  static Map<String, dynamic> parseUserData(Map<String, dynamic> rawData) {
    // Example of parsing data
    return {
      'age': rawData['age'],
      'location': rawData['location'],
      'energyUsage': rawData['energyUsage'],
      'transportationMethod': rawData['transportationMethod'],
    };
  }
}
