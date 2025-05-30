import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_movie_app/app/enums.dart';
import 'package:new_movie_app/domain/use_cases/get_recommendation_usecase.dart';
import 'package:new_movie_app/domain/use_cases/movie_details_usecase.dart';
import 'package:new_movie_app/presentation/controller/movie_details_event.dart';
import 'package:new_movie_app/presentation/controller/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this._movieDetailsUseCase, this._getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationsEvent>(_getRecommendations);
  }

  final MovieDetailsUseCase _movieDetailsUseCase;
  final GetRecommendationUseCase _getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await _movieDetailsUseCase.execute(MovieDetailsInputs(event.id));

    result.fold((failure) {
      emit(
        state.copyWith(
          movieDetailsMessage: failure.message,
          movieDetailsState: RequestState.error,
        ),
      );
    }, (data) {
      emit(
        state.copyWith(
          movieDetailsModel: data,
          movieDetailsState: RequestState.loaded,
        ),
      );
    });
  }

  FutureOr<void> _getRecommendations(
      GetRecommendationsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await _getRecommendationUseCase
        .execute(GetRecommendationInputs(event.id));

    result.fold((failure) {
      emit(
        state.copyWith(
          getRecommendationState: RequestState.error,
          getRecommendationMessage: failure.message,
        ),
      );
    }, (data) {
      emit(
        state.copyWith(
          getRecommendationModel: data.results,
          getRecommendationState: RequestState.loaded,
        ),
      );
    });
  }
}
