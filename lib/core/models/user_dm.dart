class UserDM {
  String id;
  String name;
  String email;
  List<dynamic> favoriteEvents;

  UserDM({
    required this.id,
    required this.name,
    required this.email,
    required this.favoriteEvents,
  });

  factory UserDM.fromJson(Map<String, dynamic> json) {
    return UserDM(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      favoriteEvents: json['favoriteEvents'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'favoriteEvents': favoriteEvents,
    };
  }
}
