class MovieModel {
  List<int> genreId;
  int id;
  String title;
  String overView;
  String posterPath;
  String releaseDate;
  dynamic voteAverage;
  dynamic voteCount;

  MovieModel(this.genreId, this.id, this.title, this.overView, this.posterPath,
      this.releaseDate, this.voteAverage, this.voteCount);
}

class ResultsModel {
  List<MovieModel> results;

  ResultsModel(this.results);
}

// movie details

class Genres {
  int id;
  String name;

  Genres(this.id, this.name);
}

class MovieDetailsModel {
  String backdropPath;
  List<Genres> genres;
  int id;
  String title;
  String overview;
  String releaseDate;
  int runtime;
  dynamic voteAverage;

  MovieDetailsModel(this.backdropPath, this.genres, this.id, this.title,
      this.overview, this.releaseDate, this.runtime, this.voteAverage);
}
