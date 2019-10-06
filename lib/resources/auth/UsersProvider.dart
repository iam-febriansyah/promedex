import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:http/src/response.dart' show Response;
import 'package:promedex/config.dart';
import 'package:promedex/models/auth/todoUserModel.dart';

class AuthProvider{
  Client client = Client();
  final String _urlUsers = ConfigURL().url + 'users';

  Future<List<TodoUsers>> fetchTodoUsers() async{
    print('Connected Auth');
    final Response response = await client.get(_urlUsers);
    if(response.statusCode == 200){
      return compute(TodoFromJsonUsers, response.body );
    }else{
      throw Exception('Failed to load data');
    }
  }
}

