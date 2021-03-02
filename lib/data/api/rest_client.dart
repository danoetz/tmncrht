import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:temancurhat/data/api/api_constant.dart';
import 'package:temancurhat/data/models/movies.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("now_playing")
  Future<MoviesResult> getNowPlaying(
      @Query("api_key") String apiKey, @Query("language") String language);
}
