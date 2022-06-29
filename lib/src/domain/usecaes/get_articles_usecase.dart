import 'package:injectable/injectable.dart';

import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecase/usecase.dart';
import '../entities/article.dart';
import '../repositories/articles_repository.dart';

@injectable
class GetArticlesUseCase
    implements UseCase<DataState<List<Article>>, ArticlesRequestParams> {
  final ArticlesRepository _articlesRepository;

  GetArticlesUseCase(this._articlesRepository);

  @override
  Future<DataState<List<Article>>> call({ArticlesRequestParams? params}) {
    return _articlesRepository.getBreakingNewsArticles(params!);
  }
}
