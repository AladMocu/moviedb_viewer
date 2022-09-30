import 'package:dartz/dartz.dart';
import 'package:moviedb_viewer/data/exceptions.dart';
import 'package:moviedb_viewer/domain/entities/movie_detail.dart';

abstract class MovieDetailRepository {
   Future<Either<AppException,MovieDetail>> getDetailsMovie(int id);
}