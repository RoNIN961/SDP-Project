import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'instructionModel.dart';
import 'instructionRepo.dart';

class InstructionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchInstructionData extends InstructionEvent {
  final _recipeid;

  FetchInstructionData(this._recipeid);

  @override
  List<Object> get props => [_recipeid];
}

class ResetInstructionData extends InstructionEvent {}

class InstructionState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends InstructionState {}

class LoadingInstruction extends InstructionState {}

class InstructionLoaded extends InstructionState {
  final List<InstructionModel> _result;

  InstructionLoaded(this._result);

  @override
  List<Object> get props => [_result];

  List<InstructionModel> get getResult => _result;
}

class InstructionFailedLoad extends InstructionState {}

class InstructionBloc extends Bloc<InstructionEvent, InstructionState> {
  InstructionRepo instructionRepo;

  List<InstructionModel> _result;

  List<InstructionModel> get result => _result;

  InstructionBloc(this.instructionRepo) : super(NotFetched());

  @override
  Stream<InstructionState> mapEventToState(InstructionEvent event) async* {
    if (event is FetchInstructionData) {
      yield LoadingInstruction();

      try {
        _result = await instructionRepo.getData(event._recipeid);
        if (result.length >= 1) {
          yield InstructionLoaded(_result);
          print(_result);
          print(result);
        } else {}
      } catch (_) {
        print(_);
        yield InstructionFailedLoad();
      }
    } else if (event is ResetInstructionData) {
      yield NotFetched();
    }
  }
}
