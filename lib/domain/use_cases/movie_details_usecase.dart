import 'package:dartz/dartz.dart';
import 'package:new_movie_app/data/network/failure.dart';
import 'package:new_movie_app/domain/models/models.dart';
import 'package:new_movie_app/domain/repository/repository.dart';

import 'base_use_case.dart';

class MovieDetailsUseCase
    implements BaseUseCase<MovieDetailsInputs, MovieDetailsModel> {
  final Repository _repository;

  MovieDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, MovieDetailsModel>> execute(
      MovieDetailsInputs input) async {
    return await _repository.getMovieDetails(input.movieId);
  }
}

class MovieDetailsInputs {
  int movieId;

  MovieDetailsInputs(
    this.movieId,
  );
}
