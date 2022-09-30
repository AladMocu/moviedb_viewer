import 'package:dartz/dartz.dart';
import 'package:moviedb_viewer/data/exceptions.dart';
import 'package:moviedb_viewer/domain/entities/movie.dart';
import 'package:moviedb_viewer/domain/repositories/movie_repository.dart';

class ListRatedMovies {
  final MovieRepository repository;

  ListRatedMovies(this.repository);

  Future<Either<AppException, List<Movie>>> call() async {
    return await repository.getTopRatedMovies();
  }
}