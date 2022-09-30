import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget{
  final double voteAverage;

  const RatingStars({Key? key, required this.voteAverage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Icon(
            Icons.star,
            color: index < voteAverage/2 ? Theme.of(context).highlightColor : Theme.of(context).highlightColor.withOpacity(0.2),
            size: 15,
          );
        },
      ),
    );
  }
}