import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviedb_viewer/domain/entities/movie.dart';
import 'package:moviedb_viewer/presentation/common/ratings.dart';
import 'package:moviedb_viewer/routers/routes.dart';

class MovieListItem extends StatelessWidget{
  final Movie movie;

  const MovieListItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: GestureDetector(
        onTap: ()=>Get.toNamed(Pages.detail, arguments: movie.id),
        child: SizedBox(
          height: 242,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(movie.posterPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 7,),
              Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
                style: GoogleFonts.openSans(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RatingStars(voteAverage: movie.voteAverage),
            ],
          ),
        ),
      ),
    );
  }
}