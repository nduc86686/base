import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/network/base_responsitory.dart';
import '../../core/network/client.dart';
import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../../domain/entities/article.dart';
import '../../domain/repositories/articles_repository.dart';
import '../datasources/remote/news_api_service.dart';

@injectable
class ArticlesRepositoryImpl implements ArticlesRepository {
  final NewsApiService _newsApiService;

  const ArticlesRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  ) async {
    try {
      final httpResponse = await Client.getClient().getBreakingNewsArticles(
        params.apiKey,
        params.country,
        params.category,
        params.page,
        params.pageSize,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          // request: httpResponse.response.request,
          type: DioErrorType.response, requestOptions: RequestOptions(path: ''),
        ),
      );
    } on DioError catch (e) {
      BaseRepository.catchException(e);
      return DataFailed(e);
    }
  }
}
