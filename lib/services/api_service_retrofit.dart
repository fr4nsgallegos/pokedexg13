import 'package:dio/dio.dart';
import 'package:pokemonappg13/models/article_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service_retrofit.g.dart';

@RestApi(baseUrl: "https://68cedf266dc3f35077803c79.mockapi.io/api/v1")
abstract class ApiServiceRetrofit {
  factory ApiServiceRetrofit(Dio dio, {String baseUrl}) = _ApiServiceRetrofit;

  @GET("/articles")
  Future<List<ArticleModel>> getArticles();
}
