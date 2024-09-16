class BiodiversityModel {
  List<String> _conservationActions = ['Plant Trees', 'Protect Pollinators'];
  int _protectedAreaCount = 0;

  List<String> get conservationActions => _conservationActions;
  int get protectedAreaCount => _protectedAreaCount;

  void addConservationAction(String action) {
    _conservationActions.add(action);
  }

  void protectNewArea() {
    _protectedAreaCount += 1;
  }
}
