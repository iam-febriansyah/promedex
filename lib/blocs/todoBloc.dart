import 'package:promedex/models/todoSliderModels.dart';
import 'package:rxdart/rxdart.dart';
import 'package:promedex/resources/repository.dart';

class TodoBlocSlider{
  final Repository _repository = Repository();
  final PublishSubject<List<TodoSlider>> _todoFetcher = PublishSubject<List<TodoSlider>>();
  Observable<List<TodoSlider>> get allTodo => _todoFetcher.stream;
  dynamic fetchAllTodo() async {
    final List<TodoSlider> todo = await _repository.fetchAllTodo();
    _todoFetcher.sink.add(todo);
  }
  dynamic dispose(){
    _todoFetcher.close();
  }
}

final TodoBlocSlider bloc = TodoBlocSlider();