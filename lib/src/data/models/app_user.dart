// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppUser {
  static const String collectionName = 'users';
  String id;
  String name;
  String email;
  AppUser({
    required this.id,
    required this.name,
    required this.email,
  });

  //* to json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
    };
  }

  //* from json
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}
