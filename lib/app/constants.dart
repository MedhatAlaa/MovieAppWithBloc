class Constants {
  static const String emptyString = '';
  static const String token = 'send token here';
  static const int timeOut = 60000;

  static const int emptyInt = 0;
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = 'b93e8a32bd90d5497277037668c70d4e';
  static const String getNowPlaying = 'movie/now_playing?api_key=$apiKey';
  static const String getPopular = 'movie/popular?api_key=$apiKey';
  static const String getTopRated = 'movie/top_rated?api_key=$apiKey';

  // movie details
  static const String getMovieDetails = 'movie/{movie_id}?api_key=$apiKey';
  static const String getRecommendations = 'movie/{movie_id}/recommendations?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String getImage(String path) => '$baseImageUrl$path';
}
