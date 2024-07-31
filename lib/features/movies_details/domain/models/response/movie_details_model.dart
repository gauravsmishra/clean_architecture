import '../../../../../api/api_utils.dart';
import '../../../../home/domain/model/response/movies_model.dart';

class MovieDetailsModel {
  bool? success;
  String? statusMessage;
  bool? adult;
  String? backdropPath;
  // BelongsToCollection? belongsToCollection;
  int? budget;
  // List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  Releases? releaseDates;
  Videos? videos;
  Casts? casts;
  Recommendations? recommendations;

  MovieDetailsModel(
      {this.success,
      this.statusMessage,
      this.adult,
      this.backdropPath,
      this.budget,
      this.homepage,
      this.id,
      this.imdbId,
      this.originCountry,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.releaseDates,
      this.videos,
      this.casts,
      this.recommendations});

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'] != null
        ? AppUtils.addBaseImageUrl(json['backdrop_path'])
        : null;

    budget = json['budget'];

    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'] != null
        ? AppUtils.addBaseImageUrl(json['poster_path'])
        : null;

    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];

    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    releaseDates = json['release_dates'] != null
        ? Releases.fromJson(json['release_dates'])
        : null;
    videos = json['videos'] != null ? Videos.fromJson(json['videos']) : null;
    casts = json['casts'] != null ? Casts.fromJson(json['casts']) : null;
    recommendations = json['recommendations'] != null
        ? Recommendations.fromJson(json['recommendations'])
        : null;
  }
}

class Releases {
  List<Results>? results;

  Releases({this.results});

  Releases.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  String? iso31661;
  List<ReleaseDates>? releaseDates;

  Results({this.iso31661, this.releaseDates});

  Results.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    if (json['release_dates'] != null) {
      releaseDates = <ReleaseDates>[];
      json['release_dates'].forEach((v) {
        releaseDates!.add(ReleaseDates.fromJson(v));
      });
    }
  }
}

class ReleaseDates {
  String? certification;
  List<String>? descriptors;
  String? iso6391;
  String? note;
  DateTime? releaseDate;
  int? type;

  ReleaseDates(
      {this.certification,
      this.descriptors,
      this.iso6391,
      this.note,
      this.releaseDate,
      this.type});

  ReleaseDates.fromJson(Map<String, dynamic> json) {
    certification = json['certification'];
    descriptors = json['descriptors'].cast<String>();
    iso6391 = json['iso_639_1'];
    note = json['note'];
    releaseDate = json['release_date'] != null
        ? DateTime.tryParse(json['release_date'])
        : null;
    type = json['type'];
  }
}

class VideosModel {
  Videos? videos;

  VideosModel({this.videos});

  VideosModel.fromJson(Map<String, dynamic> json) {
    videos = json['videos'] != null ? Videos.fromJson(json['videos']) : null;
  }
}

class Videos {
  List<VideoModel>? results;

  Videos({this.results});

  Videos.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <VideoModel>[];
      json['results'].forEach((v) {
        results!.add(VideoModel.fromJson(v));
      });
    }
  }
}

class VideoModel {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  VideoModel(
      {this.iso6391,
      this.iso31661,
      this.name,
      this.key,
      this.site,
      this.size,
      this.type,
      this.official,
      this.publishedAt,
      this.id});

  VideoModel.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }
}

class Casts {
  List<Cast>? cast;

  Casts({this.cast});

  Casts.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(Cast.fromJson(v));
      });
    }
  }
}

class Cast {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  Cast(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order});

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'] != null
        ? AppUtils.addBaseImageUrl(json['profile_path'])
        : null;
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['cast_id'] = castId;
    data['character'] = character;
    data['credit_id'] = creditId;
    data['order'] = order;
    return data;
  }
}

class Crew {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  Crew(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['credit_id'] = creditId;
    data['department'] = department;
    data['job'] = job;
    return data;
  }
}

class Recommendations {
  int? page;
  List<Movies>? results;
  int? totalPages;
  int? totalResults;

  Recommendations(
      {this.page, this.results, this.totalPages, this.totalResults});

  Recommendations.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Movies>[];
      json['results'].forEach((v) {
        results!.add(Movies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
