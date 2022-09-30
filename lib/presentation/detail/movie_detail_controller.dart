import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedb_viewer/domain/entities/cast.dart';
import 'package:moviedb_viewer/domain/entities/movie_detail.dart';
import 'package:moviedb_viewer/domain/repositories/credits_repository.dart';
import 'package:moviedb_viewer/domain/repositories/movie_detail_repository.dart';
import 'package:moviedb_viewer/domain/usecases/get_movie_credits.dart';
import 'package:moviedb_viewer/domain/usecases/get_movie_detail.dart';

class MovieDetailcontroller extends GetxController{

  final int id = Get.arguments;

  final RxBool loading = true.obs;
  final RxBool loadingCredits = true.obs;

  late MovieDetail movie;

  final RxList<Cast> actors = <Cast>[].obs;

  

  @override
  void onInit() {
    super.onInit();
    
    GetMovieDetail(Get.find<MovieDetailRepository>())
    .call(id)
    .then((value) => value.fold(
      (l) => ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(l.message))),
      (r) =>{movie = r, loading.value=false, getCast(id)} ));

    
  }

  void getCast(int id){
    GetMovieCredits(Get.find<CreditsRepository>())
    .call(id)
    .then((value) => value.fold(
     (l) => ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(l.message))),
      (r) =>{actors.addAll(r.cast), loadingCredits.value=false, getCast(id)} )
    );
  }
}