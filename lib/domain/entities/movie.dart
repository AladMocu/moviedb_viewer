import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String overview;

  const Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.overview,
  });

  @override
  List<Object> get props => [title, posterPath, voteAverage];
}