import 'package:dartz/dartz.dart';
import 'package:moviedb_viewer/data/exceptions.dart';
import 'package:moviedb_viewer/domain/entities/movie_detail.dart';
import 'package:moviedb_viewer/domain/repositories/movie_detail_repository.dart';

class GetMovieDetail {
  final MovieDetailRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<AppException, MovieDetail>> call(int id) async {
    return await repository.getDetailsMovie(id);
  }
}