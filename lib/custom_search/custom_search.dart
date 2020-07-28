import 'package:flutter/material.dart';
import 'package:new_flix/components/movie_card.dart';
import 'package:new_flix/detail_screen/detail_screen.dart';
import 'package:new_flix/state_management/movie_state.dart';
import 'package:provider/provider.dart';

class CustomSearch extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    final ThemeData theme = Theme.of(context);
    return ThemeData(
      primaryColor: Colors.black,
      textTheme: TextTheme(
        title: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var _movies = Provider.of<MovieState>(context, listen: true);

    final _suggestionList = query.isEmpty
        ? _movies.getMovieResult
        : _movies.getMovieResult
            .where((element) =>
                element.title.toString().toLowerCase().contains(query))
            .toList();

    // TODO: implement buildSuggestions
    return StatefulBuilder(
      builder: (context, setState) {
        return ListView.builder(
          itemCount: _suggestionList == null ? 0 : _suggestionList.length,
          itemBuilder: (context, index) {
            return MovieCard(
              movieResult: _suggestionList[index],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      movieResult: _suggestionList[index],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
