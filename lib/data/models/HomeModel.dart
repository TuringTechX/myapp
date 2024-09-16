class HomeModel {
  final String userName;
  final int points;
  final String profilePictureUrl;
  final List<String> recentActivities;
  final double carbonFootprintReduction; // In metric tons
  final String statusMessage;

  HomeModel({
    required this.userName,
    required this.points,
    required this.profilePictureUrl,
    required this.recentActivities,
    required this.carbonFootprintReduction,
    required this.statusMessage,
  });
}
