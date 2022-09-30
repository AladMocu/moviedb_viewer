import 'package:moviedb_viewer/domain/entities/movie.dart';

class MovieDTO{
  String? posterPath;
  bool? adult;
  String? overview;
  String? releaseDate;
  List<int>? genreIds;
  int id;
  String? originalTitle;
  String? originalLanguage;
  String? title;
  String? backdropPath;
  double? popularity;
  int? voteCount;
  bool? video;
  double? voteAverage;
  
  MovieDTO({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    required this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });
  
  factory MovieDTO.fromJson(Map<String, dynamic> json) => MovieDTO(
    posterPath: json["poster_path"],
    adult: json["adult"],
    overview: json["overview"],
    releaseDate: json["release_date"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalTitle: json["original_title"],
    originalLanguage: json["original_language"],
    title: json["title"],
    backdropPath: json["backdrop_path"],
    popularity: json["popularity"].toDouble(),
    voteCount: json["vote_count"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "poster_path": posterPath,
    "adult": adult,
    "overview": overview,
    "release_date": releaseDate,
    "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id,
    "original_title": originalTitle,
    "original_language": originalLanguage,
    "title": title,
    "backdrop_path": backdropPath,
    "popularity": popularity,
    "vote_count": voteCount,
    "video": video,
    "vote_average": voteAverage,
  };
  
  static List<MovieDTO> fromJsonList(List list){
    if(list.isEmpty) return [];
    return list.map((item) => MovieDTO.fromJson(item)).toList();
  }

  //to entity
  Movie toEntity() => Movie(
    posterPath: "https://image.tmdb.org/t/p/w500$posterPath",
    title: title??'',
    voteAverage: voteAverage??0.0,
    backdropPath: "https://image.tmdb.org/t/p/w500$backdropPath",
    overview: overview??'',
    id: id,
  );

  static List<Movie> toEntityList(List<MovieDTO> list){
    if(list.isEmpty) return [];
    return list.map((item) => item.toEntity()).toList();
  }
}