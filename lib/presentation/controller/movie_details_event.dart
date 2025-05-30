

import 'package:equatable/equatable.dart';

class MovieDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  GetMovieDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetRecommendationsEvent extends MovieDetailsEvent {
  final int id;

  GetRecommendationsEvent(this.id);

  @override
  List<Object> get props => [id];
}
