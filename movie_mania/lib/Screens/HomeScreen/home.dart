import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie_mania/Screens/HomeScreen/movie_grid.dart';
import 'package:movie_mania/Screens/HomeScreen/top_header.dart';
import 'package:movie_mania/Services/MovieService.dart';

import '../../Models/movie.dart';
import '../movie_shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Movie> movies = [];
  List<Movie> searchedMovies = [];
  var pageNo = 1;
  bool isLoading = false;
  bool hasSearched = false;
  String searchedMovieName = "";
  var scrollController = ScrollController();
  @override
  void initState() {
    getMovies(pageNo);
    getNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: Column(
            children: [
              TopHeader(
                callback: (movieName) {
                  hasSearched = true;
                  searchedMovies = [];
                  searchedMovieName = movieName;
                  pageNo = 1;
                  searchMovie(movieName, 1);
                },
                getAllCallback: () {
                  hasSearched = false;
                  getMovies(1);
                },
              ),
              isLoading
                  ? Expanded(child: getCardShimmer())
                  : MovieGrid(movies: hasSearched ? searchedMovies : movies, scrollController: scrollController,),
            ],
          ),
        ));
  }

  getNextPage() {
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        if(hasSearched) {
          searchMovie(searchedMovieName, pageNo);
        }
        else {
          getMovies(pageNo);
        }
      }
    });
  }
  getMovies(page) {
    isLoading = true;
    MovieService.getMovies(page).then((value) {
      print(value);
      var data = json.decode(value.body)["results"];
      var tempMovies =
          List<Movie>.from(data.map((model) => Movie.fromJson(model)));
      print(tempMovies);
      setState(() {
        movies = movies + tempMovies;
        isLoading = false;
        pageNo = page + 1;
      });
    }).onError((error, stackTrace) {
      print(error);
      setState(() {
        isLoading = false;
      });
    });
  }

  searchMovie(movieName, page) {
    isLoading = true;
    MovieService.searchMovies(page, movieName).then((value) {
      var data = json.decode(value.body)["results"];
      var tempMovies =
          List<Movie>.from(data.map((model) => Movie.fromJson(model)));
      print(tempMovies);
      setState(() {
        searchedMovies = searchedMovies + tempMovies;
        isLoading = false;
        pageNo = page + 1;
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  Widget getCardShimmer() {
    return MovieShimmer(
      child: Expanded(
        child: GridView.count(
            primary: false,
            physics: AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            shrinkWrap: false,
            children: [
              Container(),
              Container(),
              Container(),
              Container(),
            ]),
      ),
    );
  }
}
