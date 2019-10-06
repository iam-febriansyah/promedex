import 'dart:convert';

List<TodoUsers> TodoFromJsonUsers(String responseBody) {
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<TodoUsers>((dynamic json) => TodoUsers.fromJson(json)).toList();
}

class TodoUsers {
  String id;
  String name;
  String email;
  String mobile;
  String apikey;
  String status;
  DateTime createdAt;

  TodoUsers({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.apikey,
    this.status,
    this.createdAt,
  });

  factory TodoUsers.fromJson(Map<String, dynamic> json) => TodoUsers(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        mobile: json['mobile'],
        apikey: json['apikey'],
        status: json['status'],
        createdAt: DateTime.parse(json['created_at']),
    );

    Map<String, dynamic> toJson() {
      final Map<String, String> map = {
            'id': id,
            'name': name,
            'email': email,
            'mobile': mobile,
            'apikey': apikey,
            'status': status,
            'created_at': createdAt.toIso8601String(),
          };
      return map;
    }
}


