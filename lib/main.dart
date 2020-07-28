import 'package:flutter/material.dart';
import 'package:new_flix/home_screen/home_screen.dart';
import 'package:new_flix/state_management/movie_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NewFlix());
}

class NewFlix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieState(),
      child: MaterialApp(
        theme: ThemeData().copyWith(
            inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white54),
        )),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
