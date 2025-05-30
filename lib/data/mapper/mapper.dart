import 'package:new_movie_app/app/constants.dart';
import 'package:new_movie_app/app/extension.dart';
import 'package:new_movie_app/domain/models/models.dart';

import '../response/response.dart';

extension MovieResponseExtension on MovieResponse? {
  MovieModel toDomain() {
    return MovieModel(
      (this?.genreId?.map((value) => value.orZero()) ?? const Iterable.empty())
          .cast<int>()
          .toList(),
      this?.id?.orZero() ?? Constants.emptyInt,
      this?.title?.orEmpty() ?? Constants.emptyString,
      this?.overView?.orEmpty() ?? Constants.emptyString,
      this?.posterPath?.orEmpty() ?? Constants.emptyString,
      this?.releaseDate?.orEmpty() ?? Constants.emptyString,
      this?.voteAverage,
      this?.voteCount,
    );
  }
}

extension ResultResponseExtension on ResultResponse? {
  ResultsModel toDomain() {
    List<MovieModel> results =
        (this?.results?.map((value) => value.toDomain()) ??
                const Iterable.empty())
            .cast<MovieModel>()
            .toList();

    return ResultsModel(results);
  }
}

// movie details

extension GenresResponseExtension on GenresResponse? {
  Genres toDomain() {
    return Genres(
      this?.id.orZero() ?? Constants.emptyInt,
      this?.name.orEmpty() ?? Constants.emptyString,
    );
  }
}

extension MovieDetailsResponseExtension on MovieDetailsResponse? {
  MovieDetailsModel toDomain() {
    return MovieDetailsModel(
      this?.backdropPath.orEmpty() ?? Constants.emptyString,
      (this?.genres?.map((value) => value.toDomain()) ?? const Iterable.empty())
          .cast<Genres>()
          .toList(),
      this?.id.orZero() ?? Constants.emptyInt,
      this?.title.orEmpty() ?? Constants.emptyString,
      this?.overview.orEmpty() ?? Constants.emptyString,
      this?.releaseDate.orEmpty() ?? Constants.emptyString,
      this?.runtime.orZero() ?? Constants.emptyInt,
      this?.voteAverage,
    );
  }
}
