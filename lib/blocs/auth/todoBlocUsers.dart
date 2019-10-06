import 'package:promedex/models/auth/todoUserModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:promedex/resources/repository.dart';

class TodoBlocUsers{
  final Repository _repository = Repository();
  final PublishSubject<List<TodoUsers>> _todoFetcher = PublishSubject<List<TodoUsers>>();
  final _email = BehaviorSubject<String>();

  Observable<List<TodoUsers>> get allTodo => _todoFetcher.stream;
  Function(String) get updateEmail => _email.sink.add;


  dynamic checkLogin(){
    _repository.checkLogin(_email.value);
  }

  dynamic dispose(){
    _todoFetcher.close();
    _email.close();
  }
}

final TodoBlocUsers blocUsers = TodoBlocUsers();