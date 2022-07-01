import 'package:bloc/bloc.dart';
import 'package:duck/src/core/params/login/login_with_user.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/article_request.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/article.dart';
import '../../../domain/usecaes/get_articles_usecase.dart';
import '../../../domain/usecaes/login/login_usecase.dart';

part 'remote_articles_state.dart';
@injectable
class RemoteArticlesCubit extends Cubit<RemoteArticlesState> {
  final GetArticlesUseCase _getArticlesUseCase;


  RemoteArticlesCubit(this._getArticlesUseCase)
      : super(RemoteArticlesLoading());

  Future<void> getData() async {
    int _pageSize = 20;
    int _page = 1;
    List<Article>? list;
    final dataState =
        await _getArticlesUseCase.call(params: ArticlesRequestParams(page: 1));
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      final articles = dataState.data;
      final noMoreData = articles!.length < _pageSize;
      list?.addAll(articles);
      _page++;
      emit(RemoteArticlesDone(articles: articles, noMoreData: noMoreData));
    }
  }



  @override
  void onChange(Change<RemoteArticlesState> change) {
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error');
    super.onError(error, stackTrace);
  }
}
