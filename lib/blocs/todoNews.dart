import 'package:promedex/models/todoNewsModels.dart';
import 'package:rxdart/rxdart.dart';
import 'package:promedex/resources/repository.dart';

class TodoBlocNews{
  final Repository _repository = Repository();
  final PublishSubject<List<TodoNews>> _todoFetcher = PublishSubject<List<TodoNews>>();
  Observable<List<TodoNews>> get allTodo => _todoFetcher.stream;
  dynamic fetchAllTodo() async {
    final List<TodoNews> todo = await _repository.fetchAllTodoNews();
    _todoFetcher.sink.add(todo);
  }
  dynamic dispose(){
    _todoFetcher.close();
  }
}

final TodoBlocNews blocNews = TodoBlocNews();