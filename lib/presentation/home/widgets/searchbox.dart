import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget{
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 0, right: 0, bottom: 0),
            child: Icon(
              CupertinoIcons.search,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 0, right: 0, bottom: 0),
            child: Text(
              'Search',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}