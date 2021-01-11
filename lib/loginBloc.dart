import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sdp_project/loginModel.dart';
import 'package:sdp_project/loginRepo.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchLoginData extends LoginEvent {
  final _email;

  FetchLoginData(this._email);

  @override
  List<Object> get props => [_email];
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

  LoggedInSuccess(this._email);

  @override
  List<Object> get props => [_email];

  LoginModel get getEmail => _email;
}

class LoggedInFailed extends LoginState {}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo loginRepo;

  LoginBloc(this.loginRepo) : super(NotLoggedIn());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is FetchLoginData) {
      yield LoadingLogin();

      try {
        LoginModel email = await loginRepo.getData(event._email);
        yield LoggedInSuccess(email);
      } catch (_) {
        yield LoggedInFailed();
      }
    } else if (event is ResetLoginData) {
      yield NotLoggedIn();
    }
  }
}
