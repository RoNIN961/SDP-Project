import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'homerestaurantModel.dart';
import 'homerestaurantRepo.dart';

class HomeRestaurantEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchHomeRestaurantData extends HomeRestaurantEvent {
  final _resid;

  FetchHomeRestaurantData(this._resid);

  @override
  List<Object> get props => [_resid];
}

class ResetHomeRestaurantData extends HomeRestaurantEvent {}

class HomeRestaurantState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends HomeRestaurantState {}

class LoadingHomeRestaurantData extends HomeRestaurantState {}

class HomeRestaurantDataLoaded extends HomeRestaurantState {
  final List<HomeRestaurantModel> _result;

  HomeRestaurantDataLoaded(this._result);

  @override
  List<Object> get props => [_result];

  List<HomeRestaurantModel> get getResult => _result;
}

class HomeRestaurantFailedLoad extends HomeRestaurantState {}

class HomeRestaurantBloc
    extends Bloc<HomeRestaurantEvent, HomeRestaurantState> {
  HomeRestaurantRepo homeRestaurantRepo;

  List<HomeRestaurantModel> _result;

  List<HomeRestaurantModel> get result => _result;

  HomeRestaurantBloc(this.homeRestaurantRepo) : super(NotFetched());

  @override
  Stream<HomeRestaurantState> mapEventToState(
      HomeRestaurantEvent event) async* {
    if (event is FetchHomeRestaurantData) {
      yield LoadingHomeRestaurantData();

      try {
        _result = await homeRestaurantRepo.getData(event._resid);
        if (result.length >= 1) {
          yield HomeRestaurantDataLoaded(_result);
          print(_result);
          print(result);
        } else {}
      } catch (_) {
        print(_);
        yield HomeRestaurantFailedLoad();
      }
    } else if (event is ResetHomeRestaurantData) {
      yield NotFetched();
    }
  }
}
