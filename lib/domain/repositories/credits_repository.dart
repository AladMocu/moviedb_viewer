import 'package:dartz/dartz.dart';
import 'package:moviedb_viewer/data/exceptions.dart';
import 'package:moviedb_viewer/domain/entities/credits.dart';
import 'package:moviedb_viewer/domain/entities/movie_detail.dart';

abstract class CreditsRepository {
   Future<Either<AppException,Credits>> getCreditsMovie(int id);
}