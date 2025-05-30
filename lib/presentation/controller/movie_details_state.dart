import 'package:equatable/equatable.dart';
import 'package:new_movie_app/app/enums.dart';
import 'package:new_movie_app/domain/models/models.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsModel? movieDetailsModel;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  final List<MovieModel> getRecommendationModel;
  final RequestState getRecommendationState;
  final String getRecommendationMessage;

  const MovieDetailsState({
    this.movieDetailsModel,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.getRecommendationModel = const [],
    this.getRecommendationState = RequestState.loading,
    this.getRecommendationMessage = '',
  });

  MovieDetailsState copyWith({
    final MovieDetailsModel? movieDetailsModel,
    final RequestState? movieDetailsState,
    final String? movieDetailsMessage,
    final List<MovieModel>? getRecommendationModel,
    final RequestState? getRecommendationState,
    final String? getRecommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetailsModel: movieDetailsModel ?? this.movieDetailsModel,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      getRecommendationModel:
          getRecommendationModel ?? this.getRecommendationModel,
      getRecommendationState:
          getRecommendationState ?? this.getRecommendationState,
      getRecommendationMessage:
          getRecommendationMessage ?? this.getRecommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetailsModel,
        movieDetailsState,
        movieDetailsMessage,
        getRecommendationModel,
        getRecommendationState,
        getRecommendationMessage,
      ];
}
