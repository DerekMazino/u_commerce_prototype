class User {
  User({
    required this.email,
    this.image,
    required this.name,
  });

  String email;
  String? image;
  String name;

  factory User.empty() => User(name: '', email: '', image: null);
}
