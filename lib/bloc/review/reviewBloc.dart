import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'reviewModel.dart';
import 'reviewRepo.dart';

class ReviewEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchReviewData extends ReviewEvent {
  final _menuid;

  FetchReviewData(this._menuid);

  @override
  List<Object> get props => [_menuid];
}

class ResetReviewData extends ReviewEvent {}

class ReviewState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotFetched extends ReviewState {}

class LoadingReview extends ReviewState {}

class ReviewLoaded extends ReviewState {
  final List<ReviewModel> _result;

  ReviewLoaded(this._result);

  @override
  List<Object> get props => [_result];

  List<ReviewModel> get getResult => _result;
}

class ReviewFailedLoad extends ReviewState {}

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewRepo reviewRepo;

  List<ReviewModel> _result;

  List<ReviewModel> get result => _result;

  ReviewBloc(this.reviewRepo) : super(NotFetched());

  @override
  Stream<ReviewState> mapEventToState(ReviewEvent event) async* {
    if (event is FetchReviewData) {
      yield LoadingReview();

      try {
        _result = await reviewRepo.getData(event._menuid);
        if (result.length >= 1) {
          yield ReviewLoaded(_result);
          print(_result);
          print(result);
        } else {}
      } catch (_) {
        print(_);
        yield ReviewFailedLoad();
      }
    } else if (event is ResetReviewData) {
      yield NotFetched();
    }
  }
}
