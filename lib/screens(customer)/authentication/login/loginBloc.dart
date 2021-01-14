import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sdp_project/screens(customer)/authentication/login/loginModel.dart';
import 'package:sdp_project/screens(customer)/authentication/login/loginRepo.dart';

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

  LoggedInSuccess(this._email, this._password);

  @override
  List<Object> get props => [_email, _password];

  LoginModel get getEmail => _email;
  LoginModel get getPassword => _password;
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
        LoginModel email = await loginRepo.getData(event._email, null);
        LoginModel password = await loginRepo.getData(null, event._password);
        yield LoggedInSuccess(email, password);
      } catch (_) {
        yield LoggedInFailed();
      }
    } else if (event is ResetLoginData) {
      yield NotLoggedIn();
    }
  }
}
