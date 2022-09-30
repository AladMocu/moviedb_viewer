import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:moviedb_viewer/data/constants.dart';
import 'package:moviedb_viewer/data/dto/movie_detail_dto.dart';
import 'package:moviedb_viewer/data/dto/movie_dto.dart';
import 'package:moviedb_viewer/data/exceptions.dart';


class MovieDetailRemoteDataSource{
  final http.Client httpHandler;

  const MovieDetailRemoteDataSource({required this.httpHandler});

  Future<MovieDetailDTO> getMovieDetail(int id) async {
    final response = await httpHandler.get(Uri.parse(Urls.details(id)));
    if(response.statusCode == HttpStatus.ok){
      return MovieDetailDTO.fromJson(json.decode(response.body));
    }
    else{
      throw const ServerException("Error");
    }
  }
}