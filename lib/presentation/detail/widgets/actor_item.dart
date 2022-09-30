import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviedb_viewer/domain/entities/cast.dart';

class ActorItem extends StatelessWidget{
  final Cast actor;

  const ActorItem({Key? key,required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: actor.profilePath==null?const DecorationImage(image: AssetImage("assets/user_placeholder.png")):
              DecorationImage(
                image: NetworkImage(actor.profilePath!),
                fit: BoxFit.cover,
              ),
              )
            ),
          const SizedBox(
            height: 10,
          ),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}