import 'package:flutter/foundation.dart';
import '../models/HomeModel.dart';

class HomeRepository {
  Future<HomeModel> getHomeData(String userId) async {
    // Simulate an API call or local storage fetch
    await Future.delayed(Duration(seconds: 2));  // Simulate network delay

    // Mock data
    return HomeModel(
      userName: "John Doe",
      points: 3500,
      profilePictureUrl: "https://example.com/john.jpg",
      recentActivities: ["Joined Carbon Challenge", "Planted 3 trees"],
      carbonFootprintReduction: 2.5,
      statusMessage: "Making a difference!",
    );
  }
}
