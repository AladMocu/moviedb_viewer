import 'package:equatable/equatable.dart';
import 'package:moviedb_viewer/data/dto/genre_dto.dart';
import 'package:moviedb_viewer/data/dto/production_companie_dto.dart';
import 'package:moviedb_viewer/domain/entities/movie_detail.dart';

class MovieDetailDTO extends Equatable{
  bool? adult;
  String? backdropPath;
  int? budget;
  List<GenreDTO>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanyDTO>? productionCompanies;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetailDTO({
    this.adult,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  @override
  List<Object?> get props => [
    id,
    title
  ];

  factory MovieDetailDTO.fromJson(Map<String, dynamic> json) => MovieDetailDTO(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    budget: json["budget"],
    genres: List<GenreDTO>.from(json["genres"].map((x) => GenreDTO.fromJson(x))),
    homepage: json["homepage"],
    id: json["id"],
    imdbId: json["imdb_id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    productionCompanies: List<ProductionCompanyDTO>.from(json["production_companies"].map((x) => ProductionCompanyDTO.fromJson(x))),
    releaseDate: json["release_date"],
    revenue: json["revenue"],
    runtime: json["runtime"],
    status: json["status"],
    tagline: json["tagline"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );

  //to entity
  MovieDetail toEntity() => MovieDetail(
    backdropPath: "https://image.tmdb.org/t/p/original$backdropPath",
    genres: genres?.map((e) => e.toEntity()).toList(),
    overview: overview ?? '',
    posterPath: "https://image.tmdb.org/t/p/w500$posterPath",
    productionCompanies: productionCompanies?.map((e) => e.toEntity()).toList(),
    releaseDate: releaseDate ?? '',
    title: title ?? '',
    voteAverage: voteAverage ?? 0,
  );
  
}