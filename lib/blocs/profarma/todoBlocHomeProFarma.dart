import 'package:promedex/models/profarma/todoHomeProFarmaModels.dart';
import 'package:rxdart/rxdart.dart';
import 'package:promedex/resources/repository.dart';

class TodoBlocHomeProFarma{
  final Repository _repository = Repository();
  final PublishSubject<List<TodoHomeProFarma>> _todoFetcher = PublishSubject<List<TodoHomeProFarma>>();
  Observable<List<TodoHomeProFarma>> get allTodo => _todoFetcher.stream;
  dynamic fetchAllTodo() async {
    final List<TodoHomeProFarma> todo = await _repository.fetchAllTodoHomeProFarma();
    _todoFetcher.sink.add(todo);
  }
  dynamic dispose(){
    _todoFetcher.close();
  }
}

final TodoBlocHomeProFarma blocHomeProFarma = TodoBlocHomeProFarma();