class User {
  final int id;
  final String name;
  final String email;
  final String? token;

  User({required this.id, required this.name, required this.email, this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    // API returns user data nested under 'user' key and token at root
    final userData = json['user'] ?? json; // Fallback to root if no 'user' key

    return User(
      id: userData['id'] ?? 0,
      name: userData['name'] ?? '',
      email: userData['email'] ?? '',
      token: json['token'] ?? '', // Token is at root level
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'token': token};
  }
}

// class User {
//   final int id;
//   final String name;
//   final String email;
//   final String? token;

//   User({required this.id, required this.name, required this.email, this.token});

//   factory User.fromJson(Map<String, dynamic> json) {
//     //API returns user data at root level with token
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       token: json['token'], // Token is at root level in your API response
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {'id': id, 'name': name, 'email': email, 'token': token};
//   }
// }
