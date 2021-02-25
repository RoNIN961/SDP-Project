import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sdp_project/bloc/custotal/custotalModel.dart';
import 'package:sdp_project/bloc/custotal/custotalRepo.dart';

class CusTotalEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCusTotalData extends CusTotalEvent {
  final _userid;

  FetchCusTotalData(this._userid);

  @override
  List<Object> get props => [_userid];
}

class ResetCusTotalData extends CusTotalEvent {}

class CusTotalState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends CusTotalState {}

class LoadingCusTotal extends CusTotalState {}

class CusTotalLoaded extends CusTotalState {
  final List<CusTotalModel> _result;

  CusTotalLoaded(this._result);

  @override
  List<Object> get props => [_result];

  List<CusTotalModel> get getResult => _result;
}

class CusTotalFailedLoad extends CusTotalState {}

class CusTotalBloc extends Bloc<CusTotalEvent, CusTotalState> {
  CusTotalRepo cusTotalRepo;

  List<CusTotalModel> _result;

  List<CusTotalModel> get result => _result;

  CusTotalBloc(this.cusTotalRepo) : super(NotFetched());

  @override
  Stream<CusTotalState> mapEventToState(CusTotalEvent event) async* {
    if (event is FetchCusTotalData) {
      yield LoadingCusTotal();

      try {
        _result = await cusTotalRepo.getData(event._userid);
        if (result.length >= 1) {
          yield CusTotalLoaded(_result);
          print(_result);
          print(result);
        } else {}
      } catch (_) {
        yield CusTotalFailedLoad();
      }
    } else if (event is ResetCusTotalData) {
      yield NotFetched();
    }
  }
}
