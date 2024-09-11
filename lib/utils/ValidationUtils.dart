class ValidationUtils {
  static bool isValidInput(Map<String, dynamic> data) {
    // Ensure all necessary data is present
    return data.containsKey('age') && data.containsKey('energyUsage');
  }
}
