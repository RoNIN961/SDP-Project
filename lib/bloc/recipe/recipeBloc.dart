import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sdp_project/bloc/recipe/recipeRepo.dart';
import 'package:sdp_project/bloc/recipe/recipeModel.dart';

class RecipeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchRecipeData extends RecipeEvent {
  final _title;
  final _author;

  FetchRecipeData(this._title, this._author);

  @override
  List<Object> get props => [
        _title,
        _author,
      ];
}

class ResetRecipeData extends RecipeEvent {}

class RecipeState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotLoaded extends RecipeState {}

class LoadingRecipe extends RecipeState {}

class LoadedSuccess extends RecipeState {
  final _result;

  LoadedSuccess(this._result);

  @override
  List<Object> get props => [_result];

  String get result => _result;
}

class LoggedInFailed extends RecipeState {}

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeRepo recipeRepo;

  RecipeModel recipeModel;

  List<RecipeModel> _result;

  List<RecipeModel> get result => _result;

  RecipeBloc(this.recipeRepo) : super(NotLoaded());

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    if (event is FetchRecipeData) {
      yield LoadingRecipe();

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
        yield LoggedInFailed();
      }
    } else if (event is ResetRecipeData) {
      yield NotLoaded();
    }
  }
}
