import '../../../../../api/api_utils.dart';

class MoviesModel {
  bool? success;
  String? statusMessage;
  int? page;
  List<Movies>? movies;
  int? totalPages;
  int? totalResults;

  MoviesModel(
      {this.success,
      this.statusMessage,
      this.page,
      this.movies,
      this.totalPages,
      this.totalResults});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movies = <Movies>[];
      json['results'].forEach((v) {
        movies!.add(Movies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    statusMessage = json['status_message'];
    success = json['success'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['page'] = page;
  //   if (results != null) {
  //     data['results'] = results!.map((v) => v.toJson()).toList();
  //   }
  //   data['total_pages'] = totalPages;
  //   data['total_results'] = totalResults;
  //   data['status_message'] = statusMessage;
  //   return data;
  // }
}

class Movies {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Movies(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Movies.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'] != null
        ? AppUtils.addBaseImageUrl(json['backdrop_path'])
        : null;
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'] != null
        ? AppUtils.addBaseImageUrl(json['poster_path'])
        : null;
    releaseDate = json['release_date'] != null
        ? DateTime.tryParse(json['release_date'])
        : null;
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
