import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:new_movie_app/data/data_source/remote_data_source.dart';
import 'package:new_movie_app/data/network/app_api.dart';
import 'package:new_movie_app/data/network/network_info.dart';
import 'package:new_movie_app/data/repository_impl/repository_impl.dart';
import 'package:new_movie_app/domain/repository/repository.dart';
import 'package:new_movie_app/domain/use_cases/get_now_playing_usecase.dart';
import 'package:new_movie_app/domain/use_cases/get_recommendation_usecase.dart';
import 'package:new_movie_app/domain/use_cases/movie_details_usecase.dart';
import 'package:new_movie_app/domain/use_cases/popular_usecase.dart';
import 'package:new_movie_app/domain/use_cases/top_rated_usecase.dart';
import 'package:new_movie_app/presentation/controller/movie_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/dio_factory.dart';
import '../presentation/controller/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    /// dio
    sl.registerLazySingleton<DioFactory>(() => DioFactory());
    Dio dio = await sl<DioFactory>().getDio();
    sl.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

    /// data source
    sl.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(sl()));

    /// network info
    sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(InternetConnectionChecker()));

    /// repository
    sl.registerLazySingleton<Repository>(
      () => RepositoryImpl(sl(), sl()),
    );

    /// use cases
    sl.registerLazySingleton<GetNowPlayingUseCase>(
        () => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton<GetPopularUseCase>(() => GetPopularUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedUseCase>(
        () => GetTopRatedUseCase(sl()));
    sl.registerLazySingleton<MovieDetailsUseCase>(
        () => MovieDetailsUseCase(sl()));
    sl.registerLazySingleton<GetRecommendationUseCase>(
        () => GetRecommendationUseCase(sl()));

    /// bloc
    sl.registerFactory<MovieBloc>(() => MovieBloc(sl(), sl(), sl()));
    sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(sl(), sl()));
  }
}
