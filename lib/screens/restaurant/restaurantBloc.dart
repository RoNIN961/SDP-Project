import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sdp_project/screens/restaurant/restaurantModel.dart';
import 'restaurantRepo.dart';

class RestaurantEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchRestaurantData extends RestaurantEvent {
  final _resName;
  final _resEmail;
  final _resAddress;

  FetchRestaurantData(this._resName, this._resEmail, this._resAddress);

  @override
  List<Object> get props => [_resName, _resEmail, _resAddress];
}

class ResetRestaurantData extends RestaurantEvent {}

class RestaurantState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends RestaurantState {}

class LoadingRestaurantData extends RestaurantState {}

class DataFetched extends RestaurantState {
  final _resName;
  final _resEmail;
  final _resAddress;

  DataFetched(this._resName, this._resEmail, this._resAddress);

  @override
  List<Object> get props => [_resName, _resEmail, _resAddress];

  RestaurantModel get getEmail => _resName;
  RestaurantModel get getPassword => _resEmail;
  RestaurantModel get getUsername => _resAddress;
}

class DataFetchFail extends RestaurantState {}

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantRepo restaurantRepo;

  String _resName;
  String _resEmail;
  String _resAddress;

  String get getUsername => _resName;
  String get getEmail => _resEmail;
  String get getAddress => _resAddress;

  RestaurantBloc(this.restaurantRepo) : super(NotFetched());

  @override
  Stream<RestaurantState> mapEventToState(RestaurantEvent event) async* {
    if (event is FetchRestaurantData) {
      yield LoadingRestaurantData();

      try {
        RestaurantModel result = await restaurantRepo.getData(
            event._resName, event._resEmail, event._resAddress);
        if (result.rowCount > 0) {
          yield DataFetched(result.resAddress, result.resEmail, result.resName);
        } else {
          if (result.rowCount == 0) {
            yield NotFetched();
          }
        }
      } catch (_) {
        yield DataFetchFail();
      }
    } else if (event is ResetRestaurantData) {
      yield LoadingRestaurantData();
    }
  }
}
