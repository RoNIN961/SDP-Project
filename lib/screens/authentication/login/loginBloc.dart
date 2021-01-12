import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sdp_project/loginModel.dart';
import 'package:sdp_project/loginRepo.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchLoginData extends LoginEvent {
  final _user;

  FetchLoginData(this._user);

  @override
  List<Object> get props => [_user];
}

class ResetLoginData extends LoginEvent {}

class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotLoggedIn extends LoginState {}

class LoadingLogin extends LoginState {}

class LoggedInSuccess extends LoginState {
  final _user;

  LoggedInSuccess(this._user);

  @override
  List<Object> get props => [_user];

  LoginModel get getUser => _user;
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
        LoginModel user = await loginRepo.getData(event._user);
        yield LoggedInSuccess(user);
      } catch (_) {
        yield LoggedInFailed();
      }
    } else if (event is ResetLoginData) {
      yield NotLoggedIn();
    }
  }
}
