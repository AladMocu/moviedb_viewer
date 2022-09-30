import 'package:equatable/equatable.dart';
import 'package:moviedb_viewer/domain/entities/genre.dart';
import 'package:moviedb_viewer/domain/entities/production_company.dart';

class MovieDetail extends Equatable{
  final String backdropPath;
  final List<Genre>? genres;
  final String overview;
  final String posterPath;
  final List<ProductionCompany>? productionCompanies;
  final String releaseDate;
  final String title;
  final double voteAverage;

  const MovieDetail({
    required this.backdropPath,
    required this.genres,
    required this.overview,
    required this.posterPath,
    required this.productionCompanies,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
    title,
    posterPath,
    voteAverage
  ];
}