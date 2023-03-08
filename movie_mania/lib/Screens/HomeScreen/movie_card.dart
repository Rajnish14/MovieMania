import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../Models/movie.dart';

class MovieCard extends StatefulWidget {
  final Movie? movie;
  const MovieCard({super.key, this.movie});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 20,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
              image: Image.network('https://image.tmdb.org/t/p/w500/' +
                      widget.movie!.poster_path!)
                  .image,
              fit: BoxFit.fill
            ),
          ),
        ),
      )
    );
  }
}
