part of 'remote_articles_cubit.dart';

abstract class RemoteArticlesState extends Equatable {
  const RemoteArticlesState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RemoteArticlesInitial extends RemoteArticlesState {
  RemoteArticlesInitial();

  @override
  List<Object> get props => [];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  RemoteArticlesLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RemoteArticlesDone extends RemoteArticlesState {
  final List<Article>? articles;
  final bool? noMoreData;

  // final DioError ?error;

  RemoteArticlesDone({this.articles, this.noMoreData});

  @override
  // TODO: implement props
  List<Object?> get props => [articles, noMoreData];
}

class RemoteArticlesError extends RemoteArticlesState {
  RemoteArticlesError();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
