// part of 'remote_articles_bloc.dart';
//
// abstract class RemoteArticlesState extends Equatable {
//   final List<Article> articles;
//   final bool noMoreData;
//
//   final DioError error;
//
//   const RemoteArticlesState(
//       {required this.articles, required this.noMoreData, required this.error});
//
//   @override
//   List<Object> get props => [articles, noMoreData, error];
// }
//
// class RemoteArticlesLoading  {
//   RemoteArticlesLoading(
//       {List<Article>? articles, bool ?noMoreData, DioError? error})
//       : super(articles: articles, noMoreData: noMoreData, error: error);
// }
//
// class RemoteArticlesDone extends RemoteArticlesState {
//   RemoteArticlesDone(
//       {required List<Article> articles,
//       required bool noMoreData,
//       DioError? error})
//       : super(articles: articles, noMoreData: noMoreData, error: error!);
// }
//
// class RemoteArticlesError extends RemoteArticlesState {
//   RemoteArticlesError(
//       {List<Article>? articles, bool? noMoreData, DioError? error})
//       : super(articles: articles!, noMoreData: noMoreData!, error: error!);
// }
