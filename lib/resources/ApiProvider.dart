import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:http/src/response.dart' show Response;
import 'package:promedex/config.dart';
import 'package:promedex/models/todoNewsModels.dart';
import 'package:promedex/models/todoSliderModels.dart';
import 'package:promedex/models/todoKlinikModels.dart';

class ApiProvider{
  Client client = Client();
  final String _urlSlider = ConfigURL().url + 'slides';
  final String _urlNews = ConfigURL().url + 'berita';
  final String _urlKlinik = ConfigURL().url + 'daftarklinik';

  Future<List<TodoSlider>> fetchTodoList() async{
    print('Masuk Pak Eko');
    final Response response = await client.get(_urlSlider);
    if(response.statusCode == 200){
      return compute(todoFromJsonSlider, response.body );
    }else{
      throw Exception('Failed to load data');
    }
  }

  Future<List<TodoNews>> fetchTodoListNews() async{
    print('Masuk Pak Eko');
    final Response response = await client.get(_urlNews);
    if(response.statusCode == 200){
      return compute(todoFromJsonNews, response.body );
    }else{
      throw Exception('Failed to load data');
    }
  }

  Future<List<TodoKlinik>> fetchTodoListKlinik() async{
    print('Masuk Pak Eko');
    final Response response = await client.get(_urlKlinik);
    if(response.statusCode == 200){
      return compute(todoFromJsonKlinik, response.body );
    }else{
      throw Exception('Failed to load data');
    }
  }
}