// ignore: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:moviedb_viewer/domain/entities/movie_detail.dart';

class MovieInfo extends StatelessWidget{
  final MovieDetail movie;

  const MovieInfo({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start ,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Studio",style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color,fontSize: 13, fontWeight: FontWeight.w500),),
            const SizedBox(height: 5,),
            Text("Genre",style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color,fontSize: 13, fontWeight: FontWeight.w500),),
            const SizedBox(height: 5,),
            Text("Release",style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color,fontSize: 13, fontWeight: FontWeight.w500),)
          ],
        ),
        const SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround ,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Text(movie.productionCompanies![0].name,style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.7),fontSize: 13, fontWeight: FontWeight.w400),),
            const SizedBox(height: 5,),
            Text(movie.genres!.map((e) => e.name).join(", "),style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.7),fontSize: 13, fontWeight: FontWeight.w400),),
            const SizedBox(height: 5,),
            Text(movie.releaseDate.substring(0,4),style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.7),fontSize: 13, fontWeight: FontWeight.w400),),
          ],
        )
      ],
    );
  }

 
}