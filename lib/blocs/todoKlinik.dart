import 'package:promedex/models/todoKlinikModels.dart';
import 'package:rxdart/rxdart.dart';
import 'package:promedex/resources/repository.dart';

class TodoBlocKlinik{
  final Repository _repository = Repository();
  final PublishSubject<List<TodoKlinik>> _todoFetcher = PublishSubject<List<TodoKlinik>>();
  Observable<List<TodoKlinik>> get allTodo => _todoFetcher.stream;
  dynamic fetchAllTodo() async {
    final List<TodoKlinik> todo = await _repository.fetchAllTodoKlinik();
    _todoFetcher.sink.add(todo);
  }
  dynamic dispose(){
    _todoFetcher.close();
  }
}

final TodoBlocKlinik blocKlinik = TodoBlocKlinik();