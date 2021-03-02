import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:temancurhat/data/api/api_constant.dart';
import 'package:temancurhat/data/models/movies.dart';
import 'package:temancurhat/data/repository/repository.dart';

part 'beranda_event.dart';
part 'beranda_state.dart';

class BerandaBloc extends Bloc<BerandaEvent, BerandaState> {
  BerandaBloc({this.repository}) : super(BerandaInitial());

  final Repository repository;

  @override
  BerandaState get initialState => BerandaInitial();

  @override
  Stream<BerandaState> mapEventToState(BerandaEvent event) async* {
    if (event is LoadNowPlaying) {
      yield* _mapLoadNowPlayingToState();
    } else if (event is BerandaLoaded) {
      yield* _mapBerandaLoadedToState();
    }
  }

  Stream<BerandaState> _mapLoadNowPlayingToState() async* {
    try {
      yield MoviesLoading();
      var movies = await repository.getNowPlaying(
          ApiConstant.apiKey, ApiConstant.language);
      if (movies.results.isEmpty) {
        yield MoviesNoData("Movies Not Found");
      } else {
        yield MoviesHasData(movies);
      }
    } catch (e) {
      yield MoviesNetworkError(e.toString());
    }
  }

  Stream<BerandaState> _mapBerandaLoadedToState() async* {
    yield BerandaIsLoaded();
  }
}
