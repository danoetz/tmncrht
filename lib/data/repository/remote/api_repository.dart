import 'package:dio/dio.dart';
import 'package:temancurhat/data/api/api_constant.dart';
import 'package:temancurhat/data/api/rest_client.dart';
import 'package:temancurhat/data/models/movies.dart';
import 'package:temancurhat/data/repository/repository.dart';

class ApiRepository implements Repository {
  Dio _dio;
  RestClient _restClient;

  ApiRepository() {
    _dio = Dio();
    _restClient = RestClient(_dio);
  }

  @override
  Future<MoviesResult> getNowPlaying(
      [String apiKey = ApiConstant.apiKey,
      String language = ApiConstant.language]) {
    return _restClient.getNowPlaying(apiKey, language);
  }
}
