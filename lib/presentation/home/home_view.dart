// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviedb_viewer/presentation/home/home_controller.dart';
import 'package:moviedb_viewer/presentation/home/widgets/movies_section.dart';
import 'package:moviedb_viewer/presentation/home/widgets/searchbox.dart';

class HomeView extends GetView<HomeController>{
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      body: Column(
        children:[
           Padding(
            padding: EdgeInsets.only(left: 56, top:60, right: 56, bottom: 0),
            child: Text(
              'Hello, what do you want to watch ?',
              style: GoogleFonts.openSans(
                textStyle: Theme.of(context).textTheme.headline3,
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 50),
            child: SearchBox(),
          ), 
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child:  SingleChildScrollView(
                  
                  child: Column(
                      children: [
                        MoviesSection(title: "Recomended for you",movies: controller.recomendedMovies),
                        MoviesSection(title: "Top Rated",movies:  controller.topRadedMovies),
                      ],
                    ),
                ),
              ),
            ),
          )
        ]
      )
    );
  }
}