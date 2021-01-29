import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sdp_project/bloc/recipe/recipeRepo.dart';
import 'package:sdp_project/bloc/recipe/recipeModel.dart';

class RestaurantEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchRestaurantData extends RestaurantEvent {
  final _title;
  final _author;

  FetchRestaurantData(this._title, this._author);

  @override
  List<Object> get props => [
        _title,
        _author,
      ];
}

class ResetRestaurantData extends RestaurantEvent {}

class RestaurantState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotLoaded extends RestaurantState {}

class LoadingRestaurant extends RestaurantState {}

class LoadedSuccess extends RestaurantState {
  final _result;

  LoadedSuccess(this._result);

  @override
  List<Object> get props => [_result];

  String get result => _result;
}

class LoadedFailed extends RestaurantState {}

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RecipeRepo recipeRepo;

  RecipeModel recipeModel;

  List<RecipeModel> _result;

  List<RecipeModel> get result => _result;

  RestaurantBloc(this.recipeRepo) : super(NotLoaded());

  @override
  Stream<RestaurantState> mapEventToState(RestaurantEvent event) async* {
    if (event is FetchRestaurantData) {
      yield LoadingRestaurant();

      try {
        _result = await recipeRepo.getData(event._author, event._title);
        if (result.length == 1) {
          yield LoadedSuccess(result);
        } else {
          if (result.length != 1) {
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
