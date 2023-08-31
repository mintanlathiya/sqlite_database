// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModal {
  int? id;
  String userName;
  UserModal({
    this.id,
    required this.userName,
  });

  // factory UserModal.fromMap(Map<String, dynamic> json) {
  //   return UserModal(
  //     id: json['id'] != null ? json['id'] as int : null,
  //     userName: json['userName'] as String,
  //   );
  // }
  factory UserModal.fromMap(Map<String, dynamic> json) {
    return UserModal(
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
    data['usewrName'] = userName;
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }

  // String toJson() => json.encode(toMap());

  // factory UserModal.fromJson(String source) => UserModal.fromMap(json.decode(source) as Map<String, dynamic>);
}
