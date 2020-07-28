import 'package:http/http.dart' as http;
import 'package:new_flix/model/model.dart';

class Service {
  static Future<List<Result>> getNowPlaying() async {
    final URLString =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed';
    try {
      final response = await http.get(URLString);
      if (response.statusCode == 200) {
        final jsonResponse = movieDataFromJson(response.body);
        return jsonResponse.results.toList();
      } else {
        return List<Result>();
      }
    } catch (e) {
      print(e.toString());
      return List<Result>();
    }
  }
}
