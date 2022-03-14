

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_routes/api.dart';
import 'models/movies_res.dart';

class Repository {
  static Dio get _dio {
    return Dio(BaseOptions(
      baseUrl: ApiRoutes.BASE_URL,
      headers: {"${Headers.contentTypeHeader}": 'application/json'},
    ))
      ..interceptors.addAll([PrettyDioLogger(requestBody: true)]);
  }

  static Future<MovieResponse?> getMovies(
      String movies, String kannada, String all, String voting) async {
    try {
      final response = await _dio.post(ApiRoutes.BASE_URL, data: {
        'category': movies,
        'language': kannada,
        'genre': all,
        'sort': voting,
      });
      if (response.statusCode == 200) {
        return MovieResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.response!.data);
      return MovieResponse();
    }
  }
}
