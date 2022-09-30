import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:moviedb_viewer/data/constants.dart';
import 'package:moviedb_viewer/data/dto/credits_dto.dart';
import 'package:moviedb_viewer/data/dto/movie_detail_dto.dart';
import 'package:moviedb_viewer/data/dto/movie_dto.dart';
import 'package:moviedb_viewer/data/exceptions.dart';


class CreditsRemoteDataSource{
  final http.Client httpHandler;

  const CreditsRemoteDataSource({required this.httpHandler});

  Future<CreditsDTO> getMovieCredits(int id) async {
    final response = await httpHandler.get(Uri.parse(Urls.Credits(id)));
    if(response.statusCode == HttpStatus.ok){
      return CreditsDTO.fromJson(json.decode(response.body));
    }
    else{
      throw const ServerException("Error");
    }
  }
}