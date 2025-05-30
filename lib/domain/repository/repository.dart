import 'package:dartz/dartz.dart';
import 'package:new_movie_app/domain/models/models.dart';

import '../../data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, ResultsModel>> getNowPlaying();

  Future<Either<Failure, ResultsModel>> getPopular();

  Future<Either<Failure, ResultsModel>> getTopRated();

  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(int movieId);

  Future<Either<Failure, ResultsModel>> getRecommendations(int movieId);
}
