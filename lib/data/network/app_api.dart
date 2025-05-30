import 'package:dio/dio.dart';
import 'package:new_movie_app/app/constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../response/response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET(Constants.getNowPlaying)
  Future<ResultResponse> getNowPlaying();

  @GET(Constants.getPopular)
  Future<ResultResponse> getPopular();

  @GET(Constants.getTopRated)
  Future<ResultResponse> getTopRated();

  @GET(Constants.getMovieDetails)
  Future<MovieDetailsResponse> getMovieDetails(@Path('movie_id') int movieId);

  @GET(Constants.getRecommendations)
  Future<ResultResponse> getRecommendations(@Path('movie_id') int movieId);
}
