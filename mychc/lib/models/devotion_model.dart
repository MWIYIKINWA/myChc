class Devotion {
  final int id;
  final String title;
  final String scripture;
  final String message;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DevotionAuthor? author;

  Devotion({
    required this.id,
    required this.title,
    required this.scripture,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    this.author,
  });

  factory Devotion.fromJson(Map<String, dynamic> json) {
    return Devotion(
      id: json['id'],
      title: json['title'],
      scripture: json['scripture'],
      message: json['message'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      author: json['user'] != null
          ? DevotionAuthor.fromJson(json['user'])
          : null,
    );
  }
}

class DevotionAuthor {
  final int id;
  final String name;
  final String email;

  DevotionAuthor({required this.id, required this.name, required this.email});

  factory DevotionAuthor.fromJson(Map<String, dynamic> json) {
    return DevotionAuthor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
