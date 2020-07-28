import 'package:flutter/material.dart';
import 'package:new_flix/model/model.dart';
import 'package:flutter/cupertino.dart';

class MovieCard extends StatelessWidget {
  final Result movieResult;
  final Function onPressed;

  MovieCard({this.movieResult, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: 'assets/placeholder.png',
              image: 'http://image.tmdb.org/t/p/w342/${movieResult.posterPath}',
              height: 100,
              width: 60,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movieResult.title,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    movieResult.overview,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//  OpenContainer(
//  closedElevation: 0,
//  openElevation: 0,
//  closedBuilder: (context, action) => buildMovieCard(context),
//  openBuilder: (context, action) => DetailScreen(
//  movieResult: movieResult,
//  ),
//  );

  Container buildMovieCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: 'assets/placeholder.png',
            image: 'http://image.tmdb.org/t/p/w342/${movieResult.posterPath}',
            height: 100,
            width: 60,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movieResult.title,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  movieResult.overview,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
