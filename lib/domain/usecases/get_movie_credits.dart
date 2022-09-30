import 'package:dartz/dartz.dart';
import 'package:moviedb_viewer/data/exceptions.dart';
import 'package:moviedb_viewer/domain/entities/credits.dart';
import 'package:moviedb_viewer/domain/repositories/credits_repository.dart';

class GetMovieCredits {
  final CreditsRepository repository;

  GetMovieCredits(this.repository);

  Future<Either<AppException, Credits>> call(int id) async {
    return await repository.getCreditsMovie(id);
  }
}