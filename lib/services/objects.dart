import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  final Timestamp postDate;
  final String senderUserName;
  final int likeCount;
  final String category;

  const Post(
      this.postDate,
      this.senderUserName,
      this.likeCount,
      this.category,
      );
  factory Post.fromDocument(DocumentSnapshot document) {
    return Post(
      document['postDate'],
      document['senderUserName'],
      document['likeCount'],
      document['category'],
    );
  }
}

