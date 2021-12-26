import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userName;
  final String email;
  final String name;
  final String profilePictureUrl;
  final Timestamp creationDate;

  const User(this.userName,
      this.email,
      this.name,
      this.profilePictureUrl,
      this.creationDate);

  factory User.fromDocument(DocumentSnapshot document) {
    return User(
      document['userName'],
      document['email'],
      document['name'],
      document['profilePictureUrl'],
      document['creationDate'],
    );
  }
}

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

