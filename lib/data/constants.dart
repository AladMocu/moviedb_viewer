import 'package:moviedb_viewer/domain/entities/credits.dart';

class Urls{
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = String.fromEnvironment('TMDB_KEY');

  static const String popularMovies = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMovies = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static String details(int id) => "$baseUrl/movie/$id?api_key=$apiKey";
  static String Credits(int id) => "$baseUrl/movie/$id/credits?api_key=$apiKey";
}