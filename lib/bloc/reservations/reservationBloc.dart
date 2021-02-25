import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'reservationModel.dart';
import 'reservationRepo.dart';

class ReservationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchReservationData extends ReservationEvent {
  final _restaurantid;

  FetchReservationData(this._restaurantid);

  @override
  List<Object> get props => [_restaurantid];
}

class ResetReservationData extends ReservationEvent {}

class ReservationState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends ReservationState {}

class LoadingReservation extends ReservationState {}

class ReservationLoaded extends ReservationState {
  final List<ReservationModel> _result;

  ReservationLoaded(this._result);

  @override
  List<Object> get props => [_result];

  List<ReservationModel> get getResult => _result;
}

class ReservationFailedLoad extends ReservationState {}

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationRepo reservationRepo;

  List<ReservationModel> _result;

  List<ReservationModel> get result => _result;

  ReservationBloc(this.reservationRepo) : super(NotFetched());

  @override
  Stream<ReservationState> mapEventToState(ReservationEvent event) async* {
    if (event is FetchReservationData) {
      yield LoadingReservation();

      try {
        _result = await reservationRepo.getData(event._restaurantid);
        if (result.length >= 1) {
          yield ReservationLoaded(_result);
          print(_result);
          print(result);
        } else {}
      } catch (_) {
        print(_);
        yield ReservationFailedLoad();
      }
    } else if (event is ResetReservationData) {
      yield NotFetched();
    }
  }
}
