import 'package:dartz/dartz.dart';
import 'package:moviedb_viewer/data/exceptions.dart';
import 'package:moviedb_viewer/domain/entities/movie.dart';

abstract class MovieRepository {
   Future<Either<AppException,List<Movie>>> getRecomendedMovies();
   Future<Either<AppException,List<Movie>>> getTopRatedMovies();
}