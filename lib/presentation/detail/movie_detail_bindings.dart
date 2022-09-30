import 'package:get/get.dart';
import 'package:moviedb_viewer/data/datasource/movie_detail_remote_datasource.dart';
import 'package:moviedb_viewer/data/repositories/movie_detail_repository_impl.dart';
import 'package:moviedb_viewer/domain/repositories/movie_detail_repository.dart';
import 'package:moviedb_viewer/presentation/detail/movie_detail_controller.dart';
import 'package:http/http.dart' as http;

class MovieDetailBindings extends Bindings {
  @override
  void dependencies() {
    MovieDetailRemoteDataSource remoteDataSource = MovieDetailRemoteDataSource(httpHandler: http.Client());
    Get.put<MovieDetailRepository>(MovieDetailRepositoryImpl(remoteDataSource: remoteDataSource));
    Get.lazyPut<MovieDetailcontroller>(
      () => MovieDetailcontroller(),
    );
  }
}