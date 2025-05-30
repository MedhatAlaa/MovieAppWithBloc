import 'package:dartz/dartz.dart';
import 'package:new_movie_app/data/network/failure.dart';
import 'package:new_movie_app/domain/models/models.dart';
import 'package:new_movie_app/domain/repository/repository.dart';
import 'package:new_movie_app/domain/use_cases/base_use_case.dart';

class GetRecommendationUseCase
    implements BaseUseCase<GetRecommendationInputs, ResultsModel> {
  final Repository _repository;

  GetRecommendationUseCase(this._repository);

  @override
  Future<Either<Failure, ResultsModel>> execute(
      GetRecommendationInputs input) async {
    return _repository.getRecommendations(input.id);
  }
}

class GetRecommendationInputs {
  int id;

  GetRecommendationInputs(this.id);
}
