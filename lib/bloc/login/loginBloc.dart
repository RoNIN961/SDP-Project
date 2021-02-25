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
  final _username;
  final _usertype;
  final _userid;

  LoggedInSuccess(
    this._email,
    this._username,
    this._usertype,
    this._userid,
  );

  @override
  List<Object> get props => [
        _email,
        _username,
        _usertype,
        _userid,
      ];

  LoginModel get getEmail => _email;
  LoginModel get getUsername => _username;
  LoginModel get getUsertype => _usertype;
  LoginModel get getUserid => _userid;
}

class LoggedInFailed extends LoginState {}

class WrongCredentials extends LoginState {}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo loginRepo;

  LoginModel loginmodel;

  String _name;
  String _email;
  String _usertype;
  String _userid;

  String get name => _name;
  String get email => _email;
  String get usertype => _usertype;
  String get userid => _userid;

  LoginBloc(this.loginRepo) : super(NotLoggedIn());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is FetchLoginData) {
      yield LoadingLogin();

      try {
        LoginModel result =
            await loginRepo.getData(event._email, event._password);
        if (result.rowCount == 1) {
          yield LoggedInSuccess(
            result.email,
            result.username,
            result.usertype,
            result.id,
          );
          _email = result.email;
          _name = result.username;
          _usertype = result.usertype;
          _userid = result.id;
        } else {
          if (result.rowCount != 1) {
            yield WrongCredentials();
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
