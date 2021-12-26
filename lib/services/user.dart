class User {
  final String imagePath;
  final String name;
  final String username;
  final String about;


  const User({
    required this.imagePath,
    required this.name,
    required this.username,
    required this.about,

  });
}

class UserInstance {
  static const myUser = User(
    imagePath:
    'https://i.imgur.com/BJes1uq.jpeg',
    name: 'Onat Uzunyayla',
    username: 'onatuzunyayla',
    about:
    'Independent journalist writing on topics of economy',

  );
}