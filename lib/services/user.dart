class User {
  final String imagePath;
  final String name;
  final String username;
  final String about;
  final String location;


  const User({
    required this.imagePath,
    required this.name,
    required this.username,
    required this.about,
    required this.location,

  });
}

class UserInstance {
  static const myUser = User(
    imagePath:
    'https://www.sabanciuniv.edu/sites/default/files/sabanci_universitesi_logo_rgb.jpg',
    name: 'Name Surname',
    username: 'namesurname',
    about:
    'Independent journalist writing on topics of economy',
    location: "Istanbul, Turkey",
  );
}