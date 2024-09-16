class EnergyCreditModel {
  List<String> _energyCredits = [];

  List<String> get energyCredits => _energyCredits;

  void addCredit(String creditId) {
    _energyCredits.add(creditId);
  }

  void tradeCredit(String creditId) {
    _energyCredits.remove(creditId);
  }

  double calculateTotalCredits() {
    return _energyCredits.length * 10.0; // Example: each credit equals 10 energy units
  }
}
