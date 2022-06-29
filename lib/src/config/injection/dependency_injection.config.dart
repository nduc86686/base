// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasources/remote/news_api_service.dart' as _i4;
import '../../data/repositories/articles_repository_impl.dart' as _i3;
import '../../domain/repositories/articles_repository.dart' as _i6;
import '../../domain/usecaes/get_articles_usecase.dart' as _i5;
import '../../presentation/cubit/remote_articles_cubit.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $registerDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ArticlesRepositoryImpl>(
      () => _i3.ArticlesRepositoryImpl(get<_i4.NewsApiService>()));
  gh.factory<_i5.GetArticlesUseCase>(
      () => _i5.GetArticlesUseCase(get<_i6.ArticlesRepository>()));
  gh.factory<_i7.RemoteArticlesCubit>(
      () => _i7.RemoteArticlesCubit(get<_i5.GetArticlesUseCase>()));
  return get;
}
