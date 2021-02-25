import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'ingredientModel.dart';
import 'ingredientRepo.dart';

class IngredientEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchIngredientData extends IngredientEvent {
  final _recipeid;

  FetchIngredientData(this._recipeid);

  @override
  List<Object> get props => [_recipeid];
}

class ResetIngredientData extends IngredientEvent {}

class IngredientState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends IngredientState {}

class LoadingIngredient extends IngredientState {}

class IngredientLoaded extends IngredientState {
  final List<IngredientModel> _result;

  IngredientLoaded(this._result);

  @override
  List<Object> get props => [_result];

  List<IngredientModel> get getResult => _result;
}

class IngredientFailedLoad extends IngredientState {}

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
  IngredientRepo instructionRepo;

  List<IngredientModel> _result;

  List<IngredientModel> get result => _result;

  IngredientBloc(this.instructionRepo) : super(NotFetched());

  @override
  Stream<IngredientState> mapEventToState(IngredientEvent event) async* {
    if (event is FetchIngredientData) {
      yield LoadingIngredient();

      try {
        _result = await instructionRepo.getData(event._recipeid);
        if (result.length >= 1) {
          yield IngredientLoaded(_result);
          print(_result);
          print(result);
        } else {}
      } catch (_) {
        print(_);
        yield IngredientFailedLoad();
      }
    } else if (event is ResetIngredientData) {
      yield NotFetched();
    }
  }
}
