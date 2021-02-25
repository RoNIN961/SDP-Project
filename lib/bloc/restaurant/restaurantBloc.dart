import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'restaurantModel.dart';
import 'restaurantRepo.dart';

class RestaurantEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchRestaurantData extends RestaurantEvent {
  final _resemail;

  FetchRestaurantData(this._resemail);

  @override
  List<Object> get props => [_resemail];
}

class ResetRestaurantData extends RestaurantEvent {}

class RestaurantState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotLoaded extends RestaurantState {}

class LoadingRestaurant extends RestaurantState {}

class LoadedSuccess extends RestaurantState {
  final _resid;
  final _resname;
  final _contact;
  final _address;
  final _image;
  final _username;
  final _email;

  LoadedSuccess(
    this._resid,
    this._resname,
    this._contact,
    this._address,
    this._image,
    this._username,
    this._email,
  );

  @override
  List<Object> get props => [
        _resid,
        _resname,
        _contact,
        _address,
        _image,
        _username,
        _email,
      ];

  String get resid => _resid;
  String get resname => _resname;
  String get contact => _contact;
  String get address => _address;
  String get image => _image;
  String get username => _username;
  String get email => _email;
}

class LoadedFailed extends RestaurantState {}

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantRepo restaurantRepo;

  RestaurantModel restaurantModel;

  String _resname;
  String _resid;
  String _contact;
  String _address;
  String _image;
  String _username;
  String _email;

  String get resname => _resname;
  String get resid => _resid;
  String get contact => _contact;
  String get address => _address;
  String get image => _image;
  String get username => _username;
  String get email => _email;

  RestaurantBloc(this.restaurantRepo) : super(NotLoaded());

  @override
  Stream<RestaurantState> mapEventToState(RestaurantEvent event) async* {
    if (event is FetchRestaurantData) {
      yield LoadingRestaurant();

      try {
        RestaurantModel result = await restaurantRepo.getData(event._resemail);
        if (result.rowCount == 1) {
          yield LoadedSuccess(
            result.id,
            result.resname,
            result.number,
            result.address,
            result.image,
            result.username,
            result.email,
          );
          _resname = result.resname;
          _resid = result.id;
          _contact = result.number;
          _address = result.address;
          _image = result.image;
          _username = result.username;
          _email = result.email;
          _image = result.image;
        } else {
          if (result.rowCount != 1) {
            yield NotLoaded();
          }
        }
      } catch (_) {
        yield LoadedFailed();
      }
    } else if (event is ResetRestaurantData) {
      yield NotLoaded();
    }
  }
}
