import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'loginModel.dart';
import 'loginRepo.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchLoginData extends LoginEvent {
  final _email;
  final _password;

  FetchLoginData(this._email, this._password);

  @override
  List<Object> get props => [_email, _password];
}

class ResetLoginData extends LoginEvent {}

class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotLoggedIn extends LoginState {}

class LoadingLogin extends LoginState {}

class LoggedInSuccess extends LoginState {
  final _email;
  final _password;
  final _username;

  LoggedInSuccess(this._email, this._password, this._username);

  @override
  List<Object> get props => [_email, _password, _username];

  LoginModel get getEmail => _email;
  LoginModel get getPassword => _password;
  LoginModel get getUsername => _username;
}

class LoggedInFailed extends LoginState {}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo loginRepo;

  String _username;
  String _email;

  String get getUsername => _username;
  String get getEmail => _email;

  LoginBloc(this.loginRepo) : super(NotLoggedIn());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is FetchLoginData) {
      yield LoadingLogin();

      try {
        LoginModel result =
            await loginRepo.getData(event._email, event._password);
        if (result.rowCount == 1) {
          yield LoggedInSuccess(result.id, result.email, result.username);
          print(result.username);
        } else {
          if (result.rowCount != 1) {
            yield NotLoggedIn();
          }
        }
      } catch (_) {
        yield LoggedInFailed();
      }
    } else if (event is ResetLoginData) {
      yield NotLoggedIn();
    }
  }
}
