import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:new_movie_app/app/enums.dart';
import 'package:new_movie_app/domain/use_cases/get_now_playing_usecase.dart';
import 'package:new_movie_app/domain/use_cases/popular_usecase.dart';
import 'package:new_movie_app/presentation/controller/movie_events.dart';
import 'package:new_movie_app/presentation/controller/movie_states.dart';

import '../../domain/use_cases/top_rated_usecase.dart';

class MovieBloc extends Bloc<MovieEvent, MovieStates> {
  final GetNowPlayingUseCase _getNowPlayingUseCase;
  final GetPopularUseCase _getPopularUseCase;
  final GetTopRatedUseCase _getTopRatedUseCase;

  MovieBloc(
    this._getNowPlayingUseCase,
    this._getPopularUseCase,
    this._getTopRatedUseCase,
  ) : super(const MovieStates()) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await _getNowPlayingUseCase.execute(Void);

      result.fold((failure) {
        emit(state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: failure.message,
        ));
      }, (data) {
        emit(state.copyWith(
          nowPlayingResults: data.results,
          nowPlayingState: RequestState.loaded,
        ));
      });
    });
    on<GetPopularEvent>((event, emit) async {
      final result = await _getPopularUseCase.execute(Void);
      result.fold((failure) {
        emit(
          state.copyWith(
            popularMessage: failure.message,
            popularState: RequestState.error,
          ),
        );
      }, (data) {
        emit(
          state.copyWith(
            popularResults: data.results,
            popularState: RequestState.loaded,
          ),);
      });
    });

    on<GetTopRatedEvent>((event, emit) async {
      final result = await _getTopRatedUseCase.execute(Void);

      result.fold((failure) {
        emit(state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: failure.message,
        ));
      }, (data) {
        emit(state.copyWith(
          topRatedResults: data.results,
          topRatedState: RequestState.loaded,
        ));
      });
    });
  }
}
