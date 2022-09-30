import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviedb_viewer/presentation/common/ratings.dart';
import 'package:moviedb_viewer/presentation/detail/movie_detail_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moviedb_viewer/presentation/detail/widgets/actor_item.dart';
import 'package:moviedb_viewer/presentation/detail/widgets/movie_info.dart';

class MovieDetailView extends GetView<MovieDetailcontroller>{


  MovieDetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Obx(
        ()=>controller.loading.value?const Center(child: CircularProgressIndicator()):
         Stack(
          children:[
             SingleChildScrollView(
               child: Column(
                children: [
                  Container(
                    height: 320,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(controller.movie.backdropPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.movie.title,
                              style: GoogleFonts.openSans(
                                color: Theme.of(context).textTheme.bodyLarge!.color,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SvgPicture.asset('assets/4k.svg', width: 20, color: const Color(0xFF6a737e),),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: ()=>{},
                              style: ElevatedButton.styleFrom(
                                textStyle: GoogleFonts.openSans(fontSize: 11, fontWeight: FontWeight.bold),
                                primary: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.3),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text('WATCH NOW')
                             ),
                            RatingStars(voteAverage: controller.movie.voteAverage),
                          ],
                        ),
                        Text(
                          controller.movie.overview,
                          style: GoogleFonts.openSans(
                            color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.7),
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            height: 2.3
                          ),
                        ),
                        const SizedBox(height: 30,),
                        SizedBox(
                          height: 107,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.actors.length,
                            itemBuilder: (context, index){
                              return ActorItem(actor: controller.actors[index]);
                            },
                          ),
                        ),
                        MovieInfo(movie: controller.movie),
                        const SizedBox(height: 30,)
                      ],
                    ),
                  )
                ],
                ),
             ),
             Positioned(
              top: 50,
              left: 30,
              child: IconButton(
                icon: Icon(CupertinoIcons.arrow_left,color: Theme.of(context).textTheme.bodyLarge!.color),
                onPressed: ()=>Get.back(),
              )
            ),
            Positioned(
              top: 50,
              right: 30,
              child: IconButton(
                icon: Icon(CupertinoIcons.heart,color: Theme.of(context).textTheme.bodyLarge!.color,),
                onPressed: ()=>{},
              )
            ),
          ]
        ),
      )
    );
  }

}