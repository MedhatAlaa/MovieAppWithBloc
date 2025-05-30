import 'package:equatable/equatable.dart';
import 'package:new_movie_app/app/enums.dart';
import 'package:new_movie_app/domain/models/models.dart';

class MovieStates extends Equatable {
  final List<MovieModel> nowPlayingResults;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<MovieModel> popularResults;
  final RequestState popularState;
  final String popularMessage;
  final List<MovieModel> topRatedResults;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MovieStates({
    this.nowPlayingResults = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularResults = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedResults = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  MovieStates copyWith({
    List<MovieModel>? nowPlayingResults,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<MovieModel>? popularResults,
    RequestState? popularState,
    String? popularMessage,
    List<MovieModel>? topRatedResults,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MovieStates(
      nowPlayingResults: nowPlayingResults ?? this.nowPlayingResults,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,

      // popular movie
      popularResults: popularResults ?? this.popularResults,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,

      // top rated movie
      topRatedResults: topRatedResults ?? this.topRatedResults,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingResults,
        nowPlayingState,
        nowPlayingMessage,
        popularResults,
        popularState,
        popularMessage,
        topRatedResults,
        topRatedState,
        topRatedMessage
      ];
}
