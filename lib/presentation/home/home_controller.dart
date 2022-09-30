import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedb_viewer/domain/entities/movie.dart';
import 'package:moviedb_viewer/domain/repositories/movie_repository.dart';
import 'package:moviedb_viewer/domain/usecases/list_rated_movies.dart';
import 'package:moviedb_viewer/domain/usecases/list_recomended_movies.dart';

class HomeController extends GetxController {

  final RxList<Movie> _topRadedMovies = <Movie>[].obs;
  final RxList<Movie> _recomendedMovies = <Movie>[].obs;

  List<Movie> get topRadedMovies => _topRadedMovies;
  List<Movie> get recomendedMovies => _recomendedMovies;
  
  @override
  onInit(){
    super.onInit();
    initMovieLists();
  }

  void initMovieLists()async{
    ListRecomendedMovies(Get.find<MovieRepository>()).call()
    .then((value) => value.fold(
      (l) => ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(l.message))),
      (r) => _recomendedMovies.value = r
      ));

    ListRatedMovies(Get.find<MovieRepository>()).call()
    .then((value) => value.fold(
      (l) => ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(l.message))),
      (r) => _topRadedMovies.value = r
    ));
  }
}