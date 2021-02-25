import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'homerecipeModel.dart';
import 'homerecipeRepo.dart';

class HomeRecipeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchHomeRecipeData extends HomeRecipeEvent {
  final _usertype;

  FetchHomeRecipeData(this._usertype);

  @override
  List<Object> get props => [_usertype];
}

class ResetHomeRecipeData extends HomeRecipeEvent {}

class HomeRecipeState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends HomeRecipeState {}

class LoadingHomeRecipeData extends HomeRecipeState {}

class HomeRecipeDataLoaded extends HomeRecipeState {
  final List<HomeRecipeModel> _result;

  HomeRecipeDataLoaded(this._result);

  @override
  List<Object> get props => [_result];

  List<HomeRecipeModel> get getResult => _result;
}

class HomeRecipeFailedLoad extends HomeRecipeState {}

class HomeRecipeBloc extends Bloc<HomeRecipeEvent, HomeRecipeState> {
  HomeRecipeRepo homeRecipeRepo;

  List<HomeRecipeModel> _result;

  List<HomeRecipeModel> get result => _result;

  HomeRecipeBloc(this.homeRecipeRepo) : super(NotFetched());

  @override
  Stream<HomeRecipeState> mapEventToState(HomeRecipeEvent event) async* {
    if (event is FetchHomeRecipeData) {
      yield LoadingHomeRecipeData();

      try {
        _result = await homeRecipeRepo.getData(event._usertype);
        if (result.length >= 1) {
          yield HomeRecipeDataLoaded(_result);
          print(_result);
          print(result);
        } else {}
      } catch (_) {
        yield HomeRecipeFailedLoad();
      }
    } else if (event is ResetHomeRecipeData) {
      yield NotFetched();
    }
  }
}
