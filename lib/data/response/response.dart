import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponses {
  @JsonKey(name: 'status_code')
  int? statusCode;
  @JsonKey(name: 'status_message')
  String? message;
}

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: 'genre_ids')
  List<int>? genreId;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'overview')
  String? overView;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'vote_average')
  dynamic voteAverage;
  @JsonKey(name: 'vote_count')
  dynamic voteCount;

  MovieResponse(this.genreId, this.id, this.title, this.overView,
      this.posterPath, this.releaseDate, this.voteAverage, this.voteCount);

  // from json
  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  // to json

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

@JsonSerializable()
class ResultResponse extends BaseResponses {
  @JsonKey(name: 'results')
  List<MovieResponse>? results;

  ResultResponse(this.results);

  // from json
  factory ResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseFromJson(json);

  // to json

  Map<String, dynamic> toJson() => _$ResultResponseToJson(this);
}

// movie details

@JsonSerializable()
class GenresResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  GenresResponse(this.id, this.name);

  // from json
  factory GenresResponse.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$GenresResponseToJson(this);
}

@JsonSerializable()
class MovieDetailsResponse extends BaseResponses {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'genres')
  List<GenresResponse>? genres;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'runtime')
  int? runtime;
  @JsonKey(name: 'vote_average')
  dynamic voteAverage;

  MovieDetailsResponse(this.backdropPath, this.genres, this.id, this.title,
      this.overview, this.releaseDate, this.runtime, this.voteAverage);

  // from json
  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}
