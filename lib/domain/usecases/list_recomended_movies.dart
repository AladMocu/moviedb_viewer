import 'package:dartz/dartz.dart';
import 'package:moviedb_viewer/data/exceptions.dart';
import 'package:moviedb_viewer/domain/entities/movie.dart';
import 'package:moviedb_viewer/domain/repositories/movie_repository.dart';

class ListRecomendedMovies {
  final MovieRepository repository;

  ListRecomendedMovies(this.repository);

  Future<Either<AppException, List<Movie>>> call() async {
    return await repository.getRecomendedMovies();
  }
}