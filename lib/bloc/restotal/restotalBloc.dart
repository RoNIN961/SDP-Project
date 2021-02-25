import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sdp_project/bloc/restotal/restotalModel.dart';
import 'package:sdp_project/bloc/restotal/restotalRepo.dart';

class ResTotalEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchResTotalData extends ResTotalEvent {
  final _restaurantid;

  FetchResTotalData(this._restaurantid);

  @override
  List<Object> get props => [_restaurantid];
}

class ResetResTotalData extends ResTotalEvent {}

class ResTotalState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends ResTotalState {}

class LoadingResTotal extends ResTotalState {}

class ResTotalLoaded extends ResTotalState {
  final List<ResTotalModel> _result;

  ResTotalLoaded(this._result);

  @override
  List<Object> get props => [_result];

  List<ResTotalModel> get getResult => _result;
}

class ResTotalFailedLoad extends ResTotalState {}

class ResTotalBloc extends Bloc<ResTotalEvent, ResTotalState> {
  ResTotalRepo resTotalRepo;

  List<ResTotalModel> _result;

  List<ResTotalModel> get result => _result;

  ResTotalBloc(this.resTotalRepo) : super(NotFetched());

  @override
  Stream<ResTotalState> mapEventToState(ResTotalEvent event) async* {
    if (event is FetchResTotalData) {
      yield LoadingResTotal();

      try {
        _result = await resTotalRepo.getData(event._restaurantid);
        if (result.length >= 1) {
          yield ResTotalLoaded(_result);
          print(_result);
          print(result);
        } else {}
      } catch (_) {
        yield ResTotalFailedLoad();
      }
    } else if (event is ResetResTotalData) {
      yield NotFetched();
    }
  }
}
