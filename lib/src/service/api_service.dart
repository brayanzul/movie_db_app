import 'package:dio/dio.dart';
import 'package:movie_db_app/src/model/movie.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=YUOR-API-KEY';

  // Future<List<Movie>> get getTopRatedMovie async {
  //   try {} catch(error, stacktrace) {
  //     throw Exception(
  //       'Exception accoured: $error with stacktrace: $stacktrace');
  //   }
  // }

}