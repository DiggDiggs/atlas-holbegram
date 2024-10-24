// lib/models/posts.dart

class Post {
  String postId;
  String userId;
  String content;
  String imageUrl;
  DateTime timestamp;

  Post({
    required this.postId,
    required this.userId,
    required this.content,
    required this.imageUrl,
    required this.timestamp,
  });

  // You can implement similar fromSnap and toJson methods as in the Users class
}
