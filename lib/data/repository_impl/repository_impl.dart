import 'package:dartz/dartz.dart';
import 'package:new_movie_app/data/data_source/remote_data_source.dart';
import 'package:new_movie_app/data/mapper/mapper.dart';
import 'package:new_movie_app/data/network/error_handler.dart';

import 'package:new_movie_app/data/network/failure.dart';
import 'package:new_movie_app/data/network/network_info.dart';

import 'package:new_movie_app/domain/models/models.dart';

import '../../domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, ResultsModel>> getNowPlaying() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getNowPlaying();
        if (response.statusCode == ApiInternalServer.FAILURE) {
          return Left(Failure(
            ApiInternalServer.FAILURE,
            response.message ?? ResponseMessage.DEFAULT,
          ));
        } else {
          return Right(response.toDomain());
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ResultsModel>> getPopular() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getPopular();
        if (response.statusCode == ApiInternalServer.FAILURE) {
          return Left(
            Failure(ApiInternalServer.FAILURE,
                response.message ?? ResponseMessage.DEFAULT),
          );
        } else {
          return Right(response.toDomain());
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ResultsModel>> getTopRated() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getTopRated();
        if (response.statusCode == ApiInternalServer.FAILURE) {
          return Left(
            Failure(ApiInternalServer.FAILURE,
                response.message ?? ResponseMessage.DEFAULT),
          );
        } else {
          return Right(response.toDomain());
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      int movieId) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getMovieDetails(movieId);
        if (response.statusCode == ApiInternalServer.FAILURE) {
          return Left(
            Failure(
              ApiInternalServer.FAILURE,
              response.message ?? ResponseMessage.DEFAULT,
            ),
          );
        } else {
          return Right(response.toDomain());
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ResultsModel>> getRecommendations(int movieId) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getRecommendations(movieId);
        if (response.statusCode == ApiInternalServer.FAILURE) {
          return Left(
            Failure(
              ApiInternalServer.FAILURE,
              response.message ?? ResponseMessage.DEFAULT,
            ),
          );
        } else {
          return Right(response.toDomain());
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
