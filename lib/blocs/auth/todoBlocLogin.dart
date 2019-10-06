import 'package:rxdart/rxdart.dart';
import 'package:promedex/resources/repository.dart';

class TodoBlocLogin{
  final Repository _repository = Repository();
  final _email = BehaviorSubject<String>();

  Function(String) get updateEmail => _email.sink.add;

  dynamic checkLogin(){
    _repository.checkLogin(_email.value);
  }

  dynamic dispose(){
    _email.close();
  }
}

final TodoBlocLogin blocLogin = TodoBlocLogin();