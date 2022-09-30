import 'dart:io';

import 'package:moviedb_viewer/data/datasource/credits_datasource.dart';
import 'package:moviedb_viewer/data/dto/credits_dto.dart';
import 'package:moviedb_viewer/data/exceptions.dart';
import 'package:moviedb_viewer/domain/entities/credits.dart';
import 'package:moviedb_viewer/domain/repositories/credits_repository.dart';
import 'package:dartz/dartz.dart';

class CreditsRepositoryImpl implements CreditsRepository{

  

  const CreditsRepositoryImpl({required this.remoteDataSource});

  final CreditsRemoteDataSource remoteDataSource;

  @override
  Future<Either<AppException, Credits>> getCreditsMovie(int id) async{
    try{
      final CreditsDTO result = await remoteDataSource.getMovieCredits(id);
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