import 'package:flutter/foundation.dart';
import 'package:temancurhat/data/api/api_constant.dart';
import 'package:temancurhat/data/models/movies.dart';
import 'package:temancurhat/data/repository/remote/api_repository.dart';
import 'package:temancurhat/data/repository/repository.dart';

class AppRepository implements Repository {
  final ApiRepository apiRepository;

  static final AppRepository _singleton =
      AppRepository._internal(apiRepository: ApiRepository());

  factory AppRepository() {
    return _singleton;
  }

  AppRepository._internal({@required this.apiRepository});

  @override
  Future<MoviesResult> getNowPlaying(
      [String apiKey = ApiConstant.apiKey,
      String language = ApiConstant.language]) async {
    try {
      final data = await apiRepository.getNowPlaying(apiKey, language);
      return data;
    } catch (_) {
      throw Exception();
    }
  }
}
