// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int? id;
  String userName;
  User({
    this.id,
    required this.userName,
  });

  // factory User.fromMap(Map<String, dynamic> json) {
  //   return User(
  //     id: json['id'] != null ? json['id'] as int : null,
  //     userName: json['userName'] as String,
  //   );
  // }
  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
    );
  }
  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'userName': userName,
  //   };
  // }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['userName'] = userName;
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }

  // String toJson() => json.encode(toMap());

  // factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
