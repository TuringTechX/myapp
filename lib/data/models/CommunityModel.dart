class CommunityModel {
  final String postId;
  final String author;
  final String content;
  final DateTime postedAt;
  final List<String> comments;
  final int upvotes;

  CommunityModel({
    required this.postId,
    required this.author,
    required this.content,
    required this.postedAt,
    required this.comments,
    required this.upvotes,
  });
}
