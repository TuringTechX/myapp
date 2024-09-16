import '../models/CommunityModel.dart';

class CommunityRepository {
  Future<List<CommunityModel>> getCommunityPosts() async {
    // Simulate API call to fetch community posts
    await Future.delayed(Duration(seconds: 2));

    return [
      CommunityModel(
        postId: "001",
        author: "Jane Doe",
        content:
            "Let's collaborate on reducing waste in our local communities.",
        postedAt: DateTime.now().subtract(Duration(hours: 1)),
        comments: ["Great idea!", "Count me in!"],
        upvotes: 45,
      ),
    ];
  }

  Future<void> createPost(CommunityModel post) async {
    // Simulate creating a post
    await Future.delayed(Duration(seconds: 1));
  }
}
