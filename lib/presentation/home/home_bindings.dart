
import 'package:get/get.dart';
import 'package:moviedb_viewer/data/datasource/credits_datasource.dart';
import 'package:moviedb_viewer/data/datasource/movie_remote_datasource.dart';
import 'package:moviedb_viewer/data/repositories/credits_repository_impl.dart';
import 'package:moviedb_viewer/data/repositories/movie_repository_impl.dart';
import 'package:moviedb_viewer/domain/repositories/credits_repository.dart';
import 'package:moviedb_viewer/domain/repositories/movie_repository.dart';
import 'package:moviedb_viewer/presentation/home/home_controller.dart';
import 'package:http/http.dart' as http;


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    CreditsRemoteDataSource creditsRemoteDataSource = CreditsRemoteDataSource(httpHandler: http.Client());
    Get.put<CreditsRepository>(CreditsRepositoryImpl(remoteDataSource: creditsRemoteDataSource));

    MovieRemoteDataSource remoteDataSource = MovieRemoteDataSource(httpHandler: http.Client());
    Get.put<MovieRepository>(MovieRepositoryImpl(remoteDataSource: remoteDataSource));
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}