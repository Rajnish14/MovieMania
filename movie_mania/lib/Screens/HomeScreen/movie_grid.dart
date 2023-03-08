import 'package:flutter/material.dart';
import 'package:movie_mania/Screens/HomeScreen/movie_card.dart';

import '../../Models/movie.dart';

class MovieGrid extends StatefulWidget {
  final List<Movie>? movies;
  final ScrollController? scrollController;
  const MovieGrid({super.key, this.movies, this.scrollController});

  @override
  State<MovieGrid> createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        controller: widget.scrollController,
        primary: false,
        physics: AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        shrinkWrap: false,
        children: widget.movies!.map((m) {
          return MovieCard(movie: m,);
        }).toList(),
      ),
    );
  }
}
