import 'package:flutter/material.dart';
import 'package:new_flix/components/movie_card.dart';
import 'package:new_flix/custom_search/custom_search.dart';
import 'package:new_flix/detail_screen/detail_screen.dart';
import 'package:new_flix/service/service.dart';
import 'package:new_flix/state_management/movie_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  @override
  void initState() {
    _movieAPICall();
    super.initState();
  }

  _movieAPICall() {
    MovieState _movieState = Provider.of<MovieState>(context, listen: false);
    setState(() {
      _isLoading = true;
    });
    Service.getNowPlaying().then((value) {
      _movieState.setMovies(value);
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MovieState _movieState = Provider.of<MovieState>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Now Playing'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: _movieState.getMovieResult == null
                      ? null
                      : CustomSearch());
            },
          )
        ],
      ),
      body: Consumer<MovieState>(
        builder: (context, movie, child) {
          return _isLoading == false
              ? ListView.builder(
                  itemCount: movie.getMovieResult == null
                      ? 0
                      : movie.getMovieResult.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movieResult: movie.getMovieResult[index],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              movieResult: movie.getMovieResult[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                );
        },
      ),
    );
  }
}
