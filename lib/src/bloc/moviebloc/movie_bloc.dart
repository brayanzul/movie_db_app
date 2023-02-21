import 'package:bloc/bloc.dart';
import 'package:movie_db_app/src/bloc/moviebloc/movie_bloc_event.dart';
import 'package:movie_db_app/src/bloc/moviebloc/movie_bloc_state.dart';
import 'package:movie_db_app/src/model/movie.dart';
import 'package:movie_db_app/src/service/api_service.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieLoading());

  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if(event is MovieEventStarted) {
      yield* _mapMovieEventStartedToState(event.movieId, event.query);
    }
  }

  Stream<MovieState> _mapMovieEventStartedToState( 
     int movieId, query) async* {
    final service = ApiService();
    yield MovieLoading();
    try {
      List<Movie> movieList = [];
      if(movieId == 0) {
        movieList = await service.getNowPlayingMovie();
      }

      yield MovieLoaded(movieList);
    } on Exception catch (e) {
      yield MovieError();
    }
  } 
}
