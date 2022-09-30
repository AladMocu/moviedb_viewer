import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:moviedb_viewer/data/constants.dart';
import 'package:moviedb_viewer/data/dto/movie_dto.dart';
import 'package:moviedb_viewer/data/exceptions.dart';


class MovieRemoteDataSource{
  final http.Client httpHandler;

  const MovieRemoteDataSource({required this.httpHandler});

  Future<List<MovieDTO>> getPopularMovies() async {
    final response = await httpHandler.get(Uri.parse(Urls.popularMovies));
    if(response.statusCode == HttpStatus.ok){
      return MovieDTO.fromJsonList(json.decode(response.body)["results"]);
    }
    else{
      throw const ServerException("Error");
    }
  }

  Future<List<MovieDTO>> getTopRatedMovies() async {
    final response = await httpHandler.get(Uri.parse(Urls.topRatedMovies));
    if(response.statusCode == HttpStatus.ok){
      return MovieDTO.fromJsonList(json.decode(response.body)["results"]);
    }
    else{
      throw const ServerException("Error");
    }
  }
}