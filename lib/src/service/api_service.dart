import 'package:dio/dio.dart';
import 'package:movie_db_app/src/model/movie.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=YUOR-API-KEY';

  Future<List<Movie>> getNowPlayingMovie() async {
    try {
      print('Api call');
      final response = await _dio.get('$baseUrl/movie_new_playing?$apiKey');
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch(error, stacktrace) {
      throw Exception(
        'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

}