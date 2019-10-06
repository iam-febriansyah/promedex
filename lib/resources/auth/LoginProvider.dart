import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:http/src/response.dart' show Response;
import 'package:promedex/config.dart';
import 'package:promedex/models/auth/todoLoginModel.dart';

class LoginProvider{
  Client client = Client();
  final String _urlUsers = ConfigURL().url + 'checklogin';

  Future<List<TodoLogin>> checkLogin(String email) async{
    final Response response = await client.post(_urlUsers,
    body: {
      'email' : email
    });
    if (response.statusCode == 200){
      print(response.body);
      return compute(todoFromJsonLogin, response.body );
    }else{
       throw Exception('Failed login');
    }
  }
}

