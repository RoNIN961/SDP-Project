import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'adminModel.dart';
import 'adminRepo.dart';

class AdminEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAdminData extends AdminEvent {
  final _usertype;

  FetchAdminData(this._usertype);

  @override
  List<Object> get props => [_usertype];
}

class ResetAdminData extends AdminEvent {}

class AdminState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends AdminState {}

class LoadingAdminData extends AdminState {}

class AdminDataLoaded extends AdminState {
  final List<AdminModel> _result;

  AdminDataLoaded(this._result);

  @override
  List<Object> get props => [_result];

  List<AdminModel> get getResult => _result;
}

class AdminFailedLoad extends AdminState {}

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminRepo adminRepo;

  List<AdminModel> _result;

  List<AdminModel> get result => _result;

  AdminBloc(this.adminRepo) : super(NotFetched());

  @override
  Stream<AdminState> mapEventToState(AdminEvent event) async* {
    if (event is FetchAdminData) {
      yield LoadingAdminData();

      try {
        _result = await adminRepo.getData(event._usertype);
        if (result.length >= 1) {
          yield AdminDataLoaded(_result);
          print(_result);
          print(result);
        } else {}
      } catch (_) {
        yield AdminFailedLoad();
      }
    } else if (event is ResetAdminData) {
      yield NotFetched();
    }
  }
}
