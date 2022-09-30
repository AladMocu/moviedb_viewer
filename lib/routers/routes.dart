import 'package:get/get.dart';
import 'package:moviedb_viewer/domain/entities/movie.dart';
import 'package:moviedb_viewer/presentation/detail/movie_detail_bindings.dart';
import 'package:moviedb_viewer/presentation/detail/movie_detail_view.dart';
import 'package:moviedb_viewer/presentation/home/home_bindings.dart';
import 'package:moviedb_viewer/presentation/home/home_view.dart';

class Pages{
  static const String home = '/';
  static const String detail = '/detail';

   

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding()
    ),
    GetPage(
      name: detail, 
      page: 
      () => MovieDetailView(),
      binding: MovieDetailBindings()
    ),
  ];
}
