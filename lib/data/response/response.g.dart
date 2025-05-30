// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponses _$BaseResponsesFromJson(Map<String, dynamic> json) =>
    BaseResponses()
      ..statusCode = (json['status_code'] as num?)?.toInt()
      ..message = json['status_message'] as String?;

Map<String, dynamic> _$BaseResponsesToJson(BaseResponses instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.message,
    };

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      json['overview'] as String?,
      json['poster_path'] as String?,
      json['release_date'] as String?,
      json['vote_average'],
      json['vote_count'],
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'genre_ids': instance.genreId,
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overView,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

ResultResponse _$ResultResponseFromJson(Map<String, dynamic> json) =>
    ResultResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = (json['status_code'] as num?)?.toInt()
      ..message = json['status_message'] as String?;

Map<String, dynamic> _$ResultResponseToJson(ResultResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.message,
      'results': instance.results,
    };

GenresResponse _$GenresResponseFromJson(Map<String, dynamic> json) =>
    GenresResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
    );

Map<String, dynamic> _$GenresResponseToJson(GenresResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MovieDetailsResponse _$MovieDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsResponse(
      json['backdrop_path'] as String?,
      (json['genres'] as List<dynamic>?)
          ?.map((e) => GenresResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      json['overview'] as String?,
      json['release_date'] as String?,
      (json['runtime'] as num?)?.toInt(),
      json['vote_average'],
    )
      ..statusCode = (json['status_code'] as num?)?.toInt()
      ..message = json['status_message'] as String?;

Map<String, dynamic> _$MovieDetailsResponseToJson(
        MovieDetailsResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.message,
      'backdrop_path': instance.backdropPath,
      'genres': instance.genres,
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'runtime': instance.runtime,
      'vote_average': instance.voteAverage,
    };
