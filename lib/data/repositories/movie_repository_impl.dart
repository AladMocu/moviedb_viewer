import 'dart:io';

import 'package:moviedb_viewer/data/datasource/movie_remote_datasource.dart';
import 'package:moviedb_viewer/data/dto/movie_dto.dart';
import 'package:moviedb_viewer/data/exceptions.dart';
import 'package:moviedb_viewer/domain/entities/movie.dart';
import 'package:moviedb_viewer/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository{

  final MovieRemoteDataSource remoteDataSource;

  const MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppException, List<Movie>>> getRecomendedMovies() async{
    try{
      final List<MovieDTO> result = await remoteDataSource.getPopularMovies();
      return Right(MovieDTO.toEntityList(result));
    }
    on ServerException{
      return const Left(ServerException(''));
    }
    on SocketException{
      return const Left(ConnectionException(''));
    }
  }

  @override
  Future<Either<AppException, List<Movie>>> getTopRatedMovies() async{
    try{
      final List<MovieDTO> result = await remoteDataSource.getTopRatedMovies();
      return Right(MovieDTO.toEntityList(result));
    }
    on ServerException{
      return const Left(ServerException(''));
    }
    on SocketException{
      return const Left(ConnectionException(''));
    }
  }

}