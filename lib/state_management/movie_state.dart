import 'package:flutter/cupertino.dart';
import 'package:new_flix/model/model.dart';

class MovieState with ChangeNotifier {
  List<Result> _movieResult;

  List<Result> get getMovieResult => _movieResult;

  setMovies(List<Result> movies) {
    _movieResult = movies;
  }
}
