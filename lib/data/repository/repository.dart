import 'package:temancurhat/data/api/api_constant.dart';
import 'package:temancurhat/data/models/movies.dart';

abstract class Repository {
  Future<MoviesResult> getNowPlaying([
    String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language
  ]);
}
