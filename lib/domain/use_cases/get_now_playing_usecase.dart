
import 'package:dartz/dartz.dart';
import 'package:new_movie_app/data/network/failure.dart';
import 'package:new_movie_app/domain/models/models.dart';
import 'package:new_movie_app/domain/repository/repository.dart';
import 'package:new_movie_app/domain/use_cases/base_use_case.dart';

class GetNowPlayingUseCase implements BaseUseCase<void,ResultsModel>{
  final Repository _repository;

  GetNowPlayingUseCase(this._repository);

  @override
  Future<Either<Failure, ResultsModel>> execute(void input)async {
    return await _repository.getNowPlaying();
  }

}