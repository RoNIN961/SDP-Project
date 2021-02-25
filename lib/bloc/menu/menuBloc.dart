import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'menuModel.dart';
import 'menuRepo.dart';

class MenuEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMenuData extends MenuEvent {
  final _restaurantid;

  FetchMenuData(this._restaurantid);

  @override
  List<Object> get props => [_restaurantid];
}

class ResetMenuData extends MenuEvent {}

class MenuState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends MenuState {}

class LoadingMenu extends MenuState {}

class MenuLoaded extends MenuState {
  final List<MenuModel> _result;

  MenuLoaded(this._result);

  @override
  List<Object> get props => [_result];

  List<MenuModel> get getResult => _result;
}

class MenuFailedLoad extends MenuState {}

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuRepo menuRepo;

  List<MenuModel> _result;

  List<MenuModel> get result => _result;

  MenuBloc(this.menuRepo) : super(NotFetched());

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    if (event is FetchMenuData) {
      yield LoadingMenu();

      try {
        _result = await menuRepo.getData(event._restaurantid);
        if (result.length >= 1) {
          yield MenuLoaded(_result);
          print(_result);
          print(result);
        } else {}
      } catch (_) {
        yield MenuFailedLoad();
      }
    } else if (event is ResetMenuData) {
      yield NotFetched();
    }
  }
}
