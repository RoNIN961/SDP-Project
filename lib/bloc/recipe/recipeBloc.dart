import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'recipeModel.dart';
import 'recipeRepo.dart';

class RecipeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchRecipeData extends RecipeEvent {
  final _userid;

  FetchRecipeData(this._userid);

  @override
  List<Object> get props => [_userid];
}

class ResetRecipeData extends RecipeEvent {}

class RecipeState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends RecipeState {}

class LoadingRecipe extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<RecipeModel> _result;

  RecipeLoaded(this._result);

  @override
  List<Object> get props => [_result];

  List<RecipeModel> get getResult => _result;
}

class RecipeFailedLoad extends RecipeState {}

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeRepo recipeRepo;

  List<RecipeModel> _result;

  List<RecipeModel> get result => _result;

  RecipeBloc(this.recipeRepo) : super(NotFetched());

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    if (event is FetchRecipeData) {
      yield LoadingRecipe();

      try {
        _result = await recipeRepo.getData(event._userid);
        if (result.length >= 1) {
          yield RecipeLoaded(_result);
          print(_result);
          print(result);
        } else {}
      } catch (_) {
        print(_);
        yield RecipeFailedLoad();
      }
    } else if (event is ResetRecipeData) {
      yield NotFetched();
    }
  }
}
