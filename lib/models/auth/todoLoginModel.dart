import 'dart:convert';

List<TodoLogin> todoFromJsonLogin(String responseBody) {
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<TodoLogin>((dynamic json) => TodoLogin.fromJson(json)).toList();
}

class TodoLogin {
  String id;
  String email;
  String status;
  String message;

  TodoLogin({
    this.id,
    this.email,
    this.status,
    this.message,
  });

  factory TodoLogin.fromJson(Map<String, dynamic> json) 
  {
    return TodoLogin(
      id: json['id'],
      email: json['email'],
      status: json['status'],
      message: json['message'],
    );
  }

}


