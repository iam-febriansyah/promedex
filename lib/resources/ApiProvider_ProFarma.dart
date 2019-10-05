import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:http/src/response.dart' show Response;
import 'package:promedex/config.dart';
import 'package:promedex/models/profarma/todoHomeProFarmaModels.dart';

class ApiProviderProFarma{
  Client client = Client();
  final String _urlHome = ConfigURL().url + 'daftarobat';

  Future<List<TodoHomeProFarma>> fetchTodoHomeProFarma() async{
    final Response response = await client.get(_urlHome);
    if(response.statusCode == 200){
      return compute(todoFromJsonHomeProFarma, response.body );
    }else{
      throw Exception('Failed to load data');
    }
  }
}