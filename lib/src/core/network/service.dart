import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../data/models/breaking_news_response_model.dart';
import '../utils/constants.dart';

part 'service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class Service {
  factory Service(Dio dio) = _Service;

  @GET('/top-headlines')
  Future<HttpResponse<BreakingNewsResponseModel>> getBreakingNewsArticles(
    @Query("apiKey") String apiKey,
    @Query("country") String country,
    @Query("category") String category,
    @Query("page") int page,
    @Query("pageSize") int pageSize,
  );
}
