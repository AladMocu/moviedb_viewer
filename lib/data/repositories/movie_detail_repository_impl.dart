import 'dart:io';

import 'package:moviedb_viewer/data/datasource/movie_detail_remote_datasource.dart';
import 'package:moviedb_viewer/data/dto/movie_detail_dto.dart';
import 'package:moviedb_viewer/data/exceptions.dart';
import 'package:moviedb_viewer/domain/entities/movie_detail.dart';
import 'package:moviedb_viewer/domain/repositories/movie_detail_repository.dart';
import 'package:dartz/dartz.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository{

  

  const MovieDetailRepositoryImpl({required this.remoteDataSource});

  final MovieDetailRemoteDataSource remoteDataSource;

  @override
  Future<Either<AppException, MovieDetail>> getDetailsMovie(int id) async{
    try{
      final MovieDetailDTO result = await remoteDataSource.getMovieDetail(id);
      return Right(result.toEntity());
    }
    on ServerException{
      return const Left(ServerException(''));
    }
    on SocketException{
      return const Left(ConnectionException(''));
    }
  }

}