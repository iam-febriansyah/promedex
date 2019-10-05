
import 'package:promedex/models/profarma/todoHomeProFarmaModels.dart';
import 'package:promedex/models/todoKlinikModels.dart';
import 'package:promedex/models/todoNewsModels.dart';
import 'package:promedex/models/todoSliderModels.dart';
import 'package:promedex/resources/ApiProvider.dart';
import 'package:promedex/resources/ApiProvider_ProFarma.dart';

class Repository{
  final ApiProvider todoApiProvider = ApiProvider();
  Future<List<TodoSlider>> fetchAllTodo() => todoApiProvider.fetchTodoList();
  Future<List<TodoNews>> fetchAllTodoNews() => todoApiProvider.fetchTodoListNews();
  Future<List<TodoKlinik>> fetchAllTodoKlinik() => todoApiProvider.fetchTodoListKlinik();


  final ApiProviderProFarma todoApiProviderProFarma = ApiProviderProFarma();
  Future<List<TodoHomeProFarma>> fetchAllTodoHomeProFarma() => todoApiProviderProFarma.fetchTodoHomeProFarma();
}