import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviedb_viewer/domain/entities/movie.dart';
import 'package:moviedb_viewer/presentation/home/widgets/movie_list_item.dart';

class MoviesSection extends StatelessWidget{

  final List<Movie> movies;
  final String title;

  const MoviesSection({Key? key, required this.movies, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 286,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 30, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title.toUpperCase(),
                        style: GoogleFonts.openSans(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See all",
                        style: GoogleFonts.openSans(
                          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ],
          ),
          SizedBox(height: 25,),
          Expanded(
            child: Obx(
              ()=> ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  shrinkWrap: false,
                  
                  itemBuilder: (context, index) {
                    return MovieListItem(movie: movies[index]);
                  },
                  ),
            ),
          )
        ],
      ),
    );
  }
  
}